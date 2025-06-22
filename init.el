(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Load Plugins
(setq plugins-file (concat user-emacs-directory "plugins/init.el"))
(load-file plugins-file)

(setq settings-file (concat user-emacs-directory "lisp/settings/init.el"))
(load-file settings-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(marginalia magit vertico kanagawa-themes evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
