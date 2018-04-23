
(use-package eval-in-repl
  :ensure eval-in-repl)
(require 'eval-in-repl)
;; Uncomment if no need to jump after evaluating current line
;; (setq eir-jump-after-eval nil)

;; Uncomment if you want to always split the script window into two.
;; This will just split the current script window into two without
;; disturbing other windows.
;; (setq eir-always-split-script-window t)

;; Uncomment if you always prefer the two-window layout.
;; (setq eir-delete-other-windows t)

;; Place REPL on the left of the script window when splitting.
(setq eir-repl-placement 'left)


;;; ielm support (for emacs lisp)
(require 'eval-in-repl-ielm)
;; Evaluate expression in the current buffer.
(setq eir-ielm-eval-in-current-buffer t)
;; for .el files
(define-key emacs-lisp-mode-map (kbd "<C-return>") 'eir-eval-in-ielm)
;; for *scratch*
(define-key lisp-interaction-mode-map (kbd "<C-return>") 'eir-eval-in-ielm)
;; for M-x info
(define-key Info-mode-map (kbd "<C-return>") 'eir-eval-in-ielm)

;;; cider support (for Clojure)
;; (require 'cider) ; if not done elsewhere
(require 'eval-in-repl-cider)
(define-key clojure-mode-map (kbd "<C-return>") 'eir-eval-in-cider)

;;; SLIME support (for Common Lisp)
;; (require 'slime) ; if not done elsewhere
(require 'eval-in-repl-slime)
(add-hook 'lisp-mode-hook
		  '(lambda ()
		     (local-set-key (kbd "<C-return>") 'eir-eval-in-slime)))

;;; Geiser support (for Racket and Guile Scheme)
;; When using this, turn off racket-mode and scheme supports
;; (require 'geiser) ; if not done elsewhere
(require 'eval-in-repl-geiser)
(add-hook 'geiser-mode-hook
		  '(lambda ()
		     (local-set-key (kbd "<C-return>") 'eir-eval-in-geiser)))

;;; racket-mode support (for Racket; if not using Geiser)
;; (require 'racket-mode) ; if not done elsewhere
;; (require 'eval-in-repl-racket)
;; (define-key racket-mode-map (kbd "<C-return>") 'eir-eval-in-racket)

;;; Scheme support (if not using Geiser))
;; (require 'scheme)    ; if not done elsewhere
;; (require 'cmuscheme) ; if not done elsewhere
;; (require 'eval-in-repl-scheme)
;; (add-hook 'scheme-mode-hook
;; 	  '(lambda ()
;; 	     (local-set-key (kbd "<C-return>") 'eir-eval-in-scheme)))

;;; Hy support
;; (require 'hy-mode) ; if not done elsewhere
(require 'eval-in-repl-hy)
(define-key hy-mode-map (kbd "<C-return>") 'eir-eval-in-hy)


;;; Python support
;; (require 'python) ; if not done elsewhere
(require 'eval-in-repl-python)
(add-hook 'python-mode-hook
          '(lambda ()
             (local-set-key (kbd "<C-return>") 'eir-eval-in-python)))

;;; Ruby support
;; (require 'ruby-mode) ; if not done elsewhere
;; (require 'inf-ruby)  ; if not done elsewhere
(require 'eval-in-repl-ruby)
(define-key ruby-mode-map (kbd "<C-return>") 'eir-eval-in-ruby)

;;; SML support
;; (require 'sml-mode) ; if not done elsewhere
(require 'eval-in-repl-sml)
(define-key sml-mode-map (kbd "<C-return>") 'eir-eval-in-sml)
(define-key sml-mode-map (kbd "C-;") 'eir-send-to-sml-semicolon)

;;; OCaml support
;; (require 'tuareg) ; if not done elsewhere
(require 'eval-in-repl-ocaml)
(define-key tuareg-mode-map (kbd "<C-return>") 'eir-eval-in-ocaml)
;; function to send a semicolon to OCaml REPL
(define-key tuareg-mode-map (kbd "C-;") 'eir-send-to-ocaml-semicolon)

;;; Prolog support (Contributed by m00nlight)
;; if not done elsewhere
;; (autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
;; (autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
;; (autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
;; (setq prolog-system 'swi)
;; (setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
;;                                 ("\\.m$" . mercury-mode))
;;                                auto-mode-alist))
(require 'eval-in-repl-prolog)
(add-hook 'prolog-mode-hook
          '(lambda ()
             (local-set-key (kbd "<C-return>") 'eir-eval-in-prolog)))

;;; Javascript support
;; (require 'js3-mode)  ; if not done elsewhere
;; (require 'js2-mode)  ; if not done elsewhere
;; (require 'js-comint) ; if not done elsewhere
(with-eval-after-load 'js3-mode
  (require 'eval-in-repl-javascript)
  (define-key js3-mode-map (kbd "<C-return>") 'eir-eval-in-javascript))
(with-eval-after-load 'js2-mode
  (require 'eval-in-repl-javascript)
  (define-key js2-mode-map (kbd "<C-return>") 'eir-eval-in-javascript))


;; Shell support
(require 'eval-in-repl-shell)
(add-hook 'sh-mode-hook
          '(lambda()
             (local-set-key (kbd "C-<return>") 'eir-eval-in-shell)))
;; Version with opposite behavior to eir-jump-after-eval configuration
(defun eir-eval-in-shell2 ()
  "eval-in-repl for shell script (opposite behavior)

This version has the opposite behavior to the eir-jump-after-eval
configuration when invoked to evaluate a line."
  (interactive)
  (let ((eir-jump-after-eval (not eir-jump-after-eval)))
       (eir-eval-in-shell)))
(add-hook 'sh-mode-hook
          '(lambda()
             (local-set-key (kbd "C-M-<return>") 'eir-eval-in-shell2)))

;;; Elixir support
;; (require 'elixir-mode) ; if not done elsewhere
;; (require 'alchemist)   ; if not done elsewhere
(require 'eval-in-repl-ruby)
(define-key elixir-mode-map (kbd "<C-return>") 'eir-eval-in-iex)

;;; Erlang support
;; (require 'erlang-mode) ; if not done elsewhere
(require 'eval-in-repl-erlang)
(define-key erlang-mode-map (kbd "<C-return>") 'eir-eval-in-erlang)

;;; Elm support
;; (require 'elm-mode) ; if not done elsewhere
(require 'eval-in-repl-elm)
(define-key elm-mode-map (kbd "<C-return>") 'eir-eval-in-elm)

;;; Scala support
;; (require 'ensime) ; if not done elsewhere
(require 'eval-in-repl-scala)
(define-key scala-mode-map (kbd "<C-return>") 'eir-eval-in-scala)
