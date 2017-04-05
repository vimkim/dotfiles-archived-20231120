(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil))))
(custom-set-faces
 )

; (add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(key-chord-define evil-normal-state-map "c-{" 'evil-force-normal-state)
(key-chord-define evil-visual-state-map "c-{" 'evil-change-to-previous-state)





