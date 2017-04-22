;;; package ---- Summary
;;; Commentary:
;;hello Emacs!
;;; Code:
;;; Basic Configurations
(setq visible-bell 1)
;;(menu-bar-mode -1)
(tool-bar-mode -1)

(setq inhibit-startup-screen t) ; no welcome page
;;(x-focus-frame nil)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(require 'package)
(package-initialize)
(global-linum-mode t)
(setq linum-format "%d \u2502")
;;(use-package linum-relative
;;:ensure linum-relative)
;;(require 'linum-relative)
;;(linum-relative-on)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-undo-tree-mode t)
 '(package-selected-packages
   (quote
    (popwin smooth-scroll smooth-scrolling fiplr helm sublimity centered-cursor-mode ack ## autopair pkg-info evil dash)))
 '(undo-tree-auto-save-history t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup)
  )

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
(require 'evil-nerd-commenter)
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
  "bd" 'kill-buffer
  "bn" 'next-buffer
  "bp" 'previous-buffer
  ;;"bl" 'list-buffers
  "bl" 'ibuffer
  "bs" 'ido-switch-buffer
  "s" 'save-buffer
  "q" 'save-buffers-kill-terminal)
(use-package key-chord
  :ensure key-chord)
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.5)
(use-package key-seq
  :ensure key-seq)
(key-seq-define evil-insert-state-map ",s" 'my-esc-save)
(key-seq-define evil-insert-state-map ",q" 'my-esc-quit)
;(key-chord-define evil-insert-state-map ",s" 'my-esc-save)
;(key-chord-define evil-normal-state-map ",s" 'save-buffer)
;(key-chord-define evil-insert-state-map ",q" 'my-esc-quit)
;(key-chord-define evil-normal-state-map ",q" 'save-buffers-kill-terminal)
(define-key evil-insert-state-map "\C-q" 'my-esc-quit)
(define-key evil-normal-state-map "\C-q" 'save-buffers-kill-terminal)
(define-key evil-normal-state-map "\C-n" 'evil-next-line)
(define-key evil-normal-state-map "\C-p" 'evil-previous-line)

(defun my-esc-save()
  (interactive)
  (evil-normal-state)
  (save-buffer))
(defun my-esc-quit()
  (interactive)
  (evil-normal-state)
  (save-buffers-kill-terminal))


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
;; c-c ! l

;;;; MAPPING
;; gj, gk mapping
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; ;->: mapping
(define-key evil-normal-state-map (kbd ";") 'evil-ex)

;;autoindent
(define-key global-map (kbd "RET") 'newline-and-indent)

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

;; backup files go to ~/.saves
(setq backup-directory-alist `(("." . "~/.saves")))
;; back up by copy; safe and slow
;;(setq backup-by-copying t)
;;(setq make-backup-files nil) ;stop creating backup~ files
(setq auto-save-default nil) ;stop creating #autosave# files

;;;; theme
;; zenburn
(use-package zenburn-theme
  :ensure zenburn-theme)
(require 'zenburn-theme)
(load-theme 'zenburn t)
(set-face-attribute 'default nil :height 200)
;;; c-x c-- & c-x c-=

;;; yasnippet
(use-package yasnippet
  :ensure yasnippet)
(require 'yasnippet)
(yas-global-mode 1)
;; trigger snippet inside trigger
(setq yas/triggers-in-field t); Enable nested triggering of snippets
;; map to c-l and c-k
;;(define-key yas-keymap (kbd "C-l") 'yas-next-field-or-maybe-expand)
(define-key yas-keymap "\C-l" 'yas-prev-field)


;; yasnippet + ac
(setq-default ac-sources (push 'ac-source-yasnippet ac-sources))

(scroll-bar-mode -1);; hide scroll bar
;;(set-specifier vertical-scrollbar-visible-p nil)
(fset 'yes-or-no-p 'y-or-n-p)
(provide 'init)

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

(use-package centered-cursor-mode
  :ensure centered-cursor-mode)
(require 'centered-cursor-mode)
(global-centered-cursor-mode +1)

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
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

(use-package fiplr
  :ensure fiplr)
(global-set-key (kbd "C-x f") 'fiplr-find-file)

(use-package auto-complete
  :ensure auto-complete)
(ac-config-default)

;; Sane behavior of popup windows
(use-package popwin
  :ensure popwin)
(require 'popwin)
(popwin-mode 1)

;;; init.el ends here
