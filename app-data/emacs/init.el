(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

(electric-pair-mode 1)

(use-package corfu
  :ensure t
  :init
  (setq corfu-auto t
        corfu-auto-delay 0.0
        corfu-auto-prefix 1
        corfu-quit-no-match 'separator)
  (global-corfu-mode))

(setq completion-styles '(basic))
(add-hook 'emacs-lisp-mode-hook #'corfu-mode)


(use-package cape
  :ensure t
  :bind ("C-c p" . cape-prefix-map) ;; Alternative key: M-<tab>, M-p, M-+
   :init
   (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block)
 )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(cape corfu doom-themes magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
