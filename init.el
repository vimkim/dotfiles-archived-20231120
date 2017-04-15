(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
;;; custom-set-variables was added by Custom.
;;; If you edit it by hand, you could mess it up, so be careful.
;;; Your init file should contain only one such instance.
;;; If there is more than one, they won't work right.
'(package-selected-packages (quote (evil))))
(custom-set-faces
)

; (add-to-list 'load-path "~/.emacs.d/evil")
(use-package evil
             :ensure evil)
(require 'evil)
(evil-mode 1)
;(modify-syntax-entry ?_ "w") ; identify underscore is a word character
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

;(define-key evil-normal-state-map '\C-\{' 'evil-force-normal-state)
;(define-key evil-visual-state-map '\C-\{' 'evil-change-to-previous-state)
(use-package evil-leader
             :ensure evil-leader)
(require 'evil-leader)
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(defun my-esc-save()
  (interactive)
  (evil-normal-state)
  (save-buffer))
(defun my-esc-quit()
  (interactive)
  (evil-normal-state)
  (save-buffers-kill-terminal))

(use-package key-chord
             :ensure key-chord)
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map ",s" 'my-esc-save)
(key-chord-define evil-normal-state-map ",s" 'save-buffer)
(key-chord-define evil-insert-state-map ",q" 'my-esc-quit)
(key-chord-define evil-normal-state-map ",q" 'save-buffers-kill-terminal)
(define-key evil-insert-state-map "\C-q" 'my-esc-quit)
(define-key evil-normal-state-map "\C-q" 'save-buffers-kill-terminal)

;; flycheck prerequisite
(use-package exec-path-from-shell
             :ensure t)
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;; flycheck
(use-package flycheck
             :ensure t
             :init (global-flycheck-mode))
(require 'flycheck)

;;;; MAPPING
;; gj, gk mapping
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
;; ;->: mapping
;(define-key evil-normal-state-map (kbd ";") 'evil-ex &optional INITIAL-INPUT) ; not work


;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
  In Delete Selection mode, if the mark is active, just deactivate it;
  then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
    (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (## autopair pkg-info evil dash))))
;; start maximized:w

;autoindent
(define-key global-map (kbd "RET") 'newline-and-indent)

(use-package autopair
             :ensure autopair)

(require 'autopair)
(autopair-global-mode)

;; remember the cursor position of files when reopen
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; cool gdb
(setq gdb-many-windows t)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; backup files go to ~/.saves
;(setq backup-directory-alist `(("." . "~/.saves")))
;; back up by copy; safe and slow
;(setq backup-by-copying t)
(setq make-backup-files nil) ;completely disable

;;;; theme
;; zenburn
(use-package zenburn-theme
             :ensure zenburn-theme)
(require 'zenburn-theme)
(load-theme 'zenburn t)
(set-face-attribute 'default nil :height 200)
;;; c-x c-- & c-x c-=

(scroll-bar-mode -1);; hide scroll bar
;(set-specifier vertical-scrollbar-visible-p nil)
