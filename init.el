;;; package ---- Summary
;;; Commentary:
;;hello Emacs!
;;; Code:
;;; Basic Configurations
(setq debug-on-error t)
(fset 'yes-or-no-p 'y-or-n-p)
;; backup files go to ~/.saves
(setq backup-directory-alist `(("." . "~/.saves")))
;; back up by copy; safe and slow
;;(setq backup-by-copying t)
;;(setq make-backup-files nil) ;stop creating backup~ files
(setq auto-save-default nil) ;stop creating #autosave# files
(setq visible-bell 1)
;;(menu-bar-mode -1)

(tool-bar-mode -1)

(require 'whitespace)
(setq whitespace-display-mappings
      ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
      '(
        (space-mark 32 [183] [46]) ; 32 SPACE, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
        (newline-mark 10 [182 10]) ; 10 LINE FEED
        (tab-mark 9 [187 9] [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
        ))
(setq whitespace-style '(face tabs trailing tab-mark space-mark))
(set-face-attribute 'whitespace-tab nil
                    :background "#f0f0f0"
                    :foreground "#00a8a8"
                    :weight 'bold)
(set-face-attribute 'whitespace-trailing nil
                    :background "#e4eeff"
                    :foreground "#183bc8"
                    :weight 'normal)
(add-hook 'prog-mode-hook 'whitespace-mode)

(global-whitespace-mode 1)

;;(setq inhibit-startup-screen t) ; no welcome page

;;(x-focus-frame nil)

(require 'package)
;;(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;			 ("marmalade" . "https://marmalade-repo.org/packages/")
;;			 ("melpa" . "https://melpa.org/packages/")))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(require 'use-package)

(global-linum-mode t)
(setq linum-format "%d \u2502")
;;(setq linum-format "%d \t")
;;(setq linum-format "%d~")

;;(use-package linum-relative
;;:ensure linum-relative)
;;(require 'linum-relative)
;;(linum-relative-on)

(use-package jedi
  :ensure jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t) ; optional
(add-hook 'python-mode-hook 'jedi:ac-setup)

;; (add-to-list 'load-path "~/.emacs.d/evil")
(use-package evil
  :ensure evil)
(require 'evil)
(evil-mode 1)
(add-to-list 'evil-emacs-state-modes 'nav-mode) ; disable when nagivation ; does not work

;;(modify-syntax-entry ?_ "w") ; identify underscore is a word character
;;; evil plugins
(use-package evil-surround
  :ensure evil-surround)
(require 'evil-surround)
(global-evil-surround-mode 1)
(use-package evil-nerd-commenter
  :ensure evil-nerd-commenter)
(require 'evil-nerd-commenter) ;; C-c l
(use-package evil-exchange
  :ensure evil-exchange)
(require 'evil-exchange)
;; change default key bindings (if you want) here, before (evil-exchange-install) is called
;; (setq evil-exchange-key (kbd "zx"))
(evil-exchange-install)
(evil-exchange-cx-install)

;;;; cursor color control
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

;;(define-key evil-normal-state-map '\C-\{' 'evil-force-normal-state)
;;(define-key evil-visual-state-map '\C-\{' 'evil-change-to-previous-state)
(use-package evil-leader
  :ensure evil-leader)
(require 'evil-leader)
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode) ; You should enable this before evil mode, otherwise does not work in initial buffers (*scratch*, etc.).
(evil-leader/set-leader ",")
(evil-leader/set-key
  ;;"bd" 'kill-buffer
  "bd" 'kill-this-buffer
  "bn" 'next-buffer
  "bp" 'previous-buffer
  ;;"bl" 'list-buffers
  "bl" 'ibuffer
  "bs" 'ido-switch-buffer
  "s" 'save-buffer
  ;;"q" 'save-buffers-kill-terminal
  "q" 'kill-this-buffer
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line)
(use-package key-chord
  :ensure key-chord)
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.5)
(use-package key-seq
  :ensure key-seq)
(key-seq-define evil-insert-state-map ",s" 'my-esc-save)
(key-seq-define evil-insert-state-map ",q" 'my-esc-quit)
(key-seq-define evil-normal-state-map "gf" 'helm-find-files)
                                        ;(key-chord-define evil-insert-state-map ",s" 'my-esc-save)
                                        ;(key-chord-define evil-normal-state-map ",s" 'save-buffer)
                                        ;(key-chord-define evil-insert-state-map ",q" 'my-esc-quit)
                                        ;(key-chord-define evil-normal-state-map ",q" 'save-buffers-kill-terminal)
(define-key evil-insert-state-map "\C-q" 'my-esc-quit)
;;(define-key evil-normal-state-map "\C-q" 'save-buffers-kill-terminal)
(define-key evil-normal-state-map "\C-q" 'kill-this-buffer)
(define-key evil-normal-state-map "\C-n" 'evil-next-line)
(define-key evil-normal-state-map "\C-p" 'evil-previous-line)

(defun my-esc-save()
  (interactive)
  (evil-normal-state)
  (save-buffer))
(defun my-esc-quit()
  (interactive)
  (evil-normal-state)
  ;;(save-buffers-kill-terminal)
  (kill-this-buffer))

;; flycheck prerequisite
(use-package exec-path-from-shell
  :ensure t)
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;; flycheck
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))
(require 'flycheck)
;;(evil-set-initial-state 'flycheck-error-list-mode 'emacs)
(set-face-attribute 'flycheck-warning nil
                    :foreground "yellow"
                    :background "red")
                                        ;(add-hook 'flycheck-error-list-mode-hook 'turn-off-evil-mode)
;; c-c ! l
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;;; MAPPING
;; gj, gk mapping
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; ;->: mapping
(define-key evil-normal-state-map (kbd ";") 'evil-ex)

;;tab to space indent
(setq-default indent-tabs-mode nil)

;;autoindent
(define-key global-map (kbd "RET") 'newline-and-indent)
;; c specific
(require 'cc-mode)
;;(setq-default c-basic-offset 4) ;simple indent width
(setq c-default-style "bsd"
      c-basic-offset 4)


(use-package autopair
  :ensure autopair)
(require 'autopair)
(autopair-global-mode)

;; remember the cursor position of files when reopen
(save-place-mode 1)
(if (version< emacs-version "25.0")
    (progn
      (require 'saveplace)
      (setq-default save-place t))
  (save-place-mode 1))

;; cool gdb
(setq gdb-many-windows t) ; assignment to free variable warning?


;;;; theme
;; zenburn
(use-package zenburn-theme
  :ensure zenburn-theme)
(require 'zenburn-theme)
(load-theme 'zenburn t)

;; (use-package hc-zenburn-theme
;;   :ensure hc-zenburn-theme)
;; (require 'hc-zenburn-theme)
;; (load-theme 'hc-zenburn t)

;; font size 20pt
(set-face-attribute 'default nil :height 200)
;;; c-x c-- & c-x c-=

;;; yasnippet
(use-package yasnippet
  :ensure yasnippet)
(require 'yasnippet)
(yas-global-mode 1)
;; trigger snippet inside trigger
(setq yas-triggers-in-field t); Enable nested triggering of snippets
;; map to c-l and c-k
;;(define-key yas-keymap (kbd "C-l") 'yas-next-field-or-maybe-expand)
(define-key yas-keymap (kbd "C-l") 'yas-next-field)
(define-key yas-keymap "\C-l" 'yas-prev-field)


;; yasnippet + ac
(setq-default ac-sources (push 'ac-source-yasnippet ac-sources))

(scroll-bar-mode -1);; hide scroll bar
;;(set-specifier vertical-scrollbar-visible-p nil)

;; Not much useful
;;(autoload 'comint-dynamic-complete-filename "comint" nil t)
;;(global-set-key "\M-]" 'comint-dynamic-complete-filename)

;; emacswiki complete file name

(global-set-key (kbd "M-/") 'hippie-expand) ; I like this! It prompts auto-completion list
;; switch to minibuffer no matter what
(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))
(global-set-key "\C-co" 'switch-to-minibuffer) ;; Bind to `C-c o`

;; ACK
;; howto? m-x ack or c-u c-u m-x ack
(use-package ack
  :ensure ack)
(require 'ack)

;; centered line
;;(use-package centered-cursor-mode
;;  :ensure centered-cursor-mode)
;;(require 'centered-cursor-mode)
;;(global-centered-cursor-mode +1)

(use-package ido
  :ensure ido)
(require 'ido)
(ido-mode 1)
(setq ido-separator "\n")

(defun switch-to-minibuffer-window ()
  "Switch to minibuffer window (if active)."
  (interactive)
  (when (active-minibuffer-window)
    (select-frame-set-input-focus (window-frame (active-minibuffer-window)))
    (select-window (active-minibuffer-window))))
(global-set-key (kbd "<f7>") 'switch-to-minibuffer-window)
(use-package undo-tree
  :ensure undo-tree)
(require 'undo-tree)
(global-undo-tree-mode t) ; use c-x u and hjkl
;;(undo-tree-auto-save-history t) ;use m-x customize-group instead.
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
;;(setq backup-directory-alist `(("." . "~/.saves")))

;; save undo history

;;advanced buffer navigation
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Makes *scratch* empty.
(setq initial-scratch-message "")
;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  "Remove *scratch* and *messages*."
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)
;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; thanks for the source: https://unix.stackexchange.com/questions/19874/prevent-unwanted-buffers-from-opening

(use-package helm
  :ensure helm)
(require 'helm-config)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x r b") #'helm-bookmarks)
(global-set-key (kbd "M-x") #'helm-M-x)
;;(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)


(use-package fiplr
  :ensure fiplr)
(global-set-key (kbd "C-x f") 'fiplr-find-file)

(use-package auto-complete
  :ensure auto-complete)
(ac-config-default)
;; C-n C-p
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;; (use-package company
;;   :ensure company)
;; (require 'company)
;; (global-company-mode t)

;; Sane behavior of popup windows (move focus to popup)
(use-package popwin
  :ensure popwin)
(add-to-list 'popwin:special-display-config `(flycheck-error-list-mode :height 0.5 :regexp t :position bottom))
(require 'popwin)
(popwin-mode 1)

;;shackle does similar
;;(use-package shackle
;;  :ensure shackle)
;;(require 'shackle)

;; macos clipboard copy / paste
;; M-| (shell-command-on-region) pbpaste RET
(defun pbcopy-macos ()
  "'mac-os' copy to clipboard."
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))
(global-set-key (kbd "C-c c") 'pbcopy-macos)

(use-package helm-etags-plus
  :ensure helm-etags-plus)
;; supports multiple tag files
;;(setq tags-table-list '("/path/of/tags1" "/path/of/tags2"))

;;(use-package ctags-update
;; :ensure ctags-update)
;;(autoload 'turn-on-ctags-auto-update-mode "ctags-update" "turn on 'ctags-auto-update-mode'." t)
;;(add-hook 'c-mode-common-hook  'turn-on-ctags-auto-update-mode)
;;(add-hook 'emacs-lisp-mode-hook  'turn-on-ctags-auto-update-mode)

;; if you want to update (create) TAGS manually
;;(autoload 'ctags-update "ctags-update" "update TAGS using ctags" t)
;;(global-set-key "\C-cE" 'ctags-update)

(use-package tabbar
  :ensure tabbar)
(tabbar-mode t)

(defadvice find-tag (around refresh-etags activate)
  "Rerun etags and reload tags if tag not found and redo find-tag.  If buffer is modified, ask about save before running etags.  "
  (let ((extension (file-name-extension (buffer-file-name))))
    (condition-case err
        ad-do-it
      (error (and (buffer-modified-p)
                  (not (ding))
                  (y-or-n-p "Buffer is modified, save it? ")
                  (save-buffer))
             (er-refresh-etags extension)
             ad-do-it))))

(defun er-refresh-etags (&optional extension)
  "Run etags on all peer files in current dir and reload them silently."
  (interactive)
  (shell-command (format "etags *.%s" (or extension "el")))
  (let ((tags-revert-without-query t))  ; don't query, revert silently
    (visit-tags-table default-directory nil)))

;; mac + iterm2 mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
  )

(use-package visual-regexp
  :ensure visual-regexp)
(require 'visual-regexp)
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
(define-key global-map (kbd "C-c m") 'vr/mc-mark)
(use-package visual-regexp-steroids
  :ensure visual-regexp-steroids)
(require 'visual-regexp-steroids)

(defun allman-to-kandr()
  (interactive)
  ;;(vr/query-replace ")\s*{" "){" (point-min) (point-max)))
  (vr/query-replace "custom" "hey" (point-min) (point-max)))


(defun hello()
  "hello world and you can call it via M-x hello."
  (interactive)
  (message "Hello world!"))

(defun hello(someone)
  "Say hello to SOMEONE via M-x hello."
  (interactive "swho do you want to say hello to? ")
  (message "hello %s!" someone))

(provide 'init)
;;; nit.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (tabbar popwin fiplr helm ack yasnippet zenburn-theme autopair flycheck exec-path-from-shell key-seq key-chord evil-leader evil-exchange evil-nerd-commenter evil-surround evil jedi use-package)))
 '(undo-tree-auto-save-history t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; following functions evil-normal-state might not be evaluated at runtime - completely normal
