(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name (locate-user-emacs-file "custom.el")))
(load custom-file :no-error :no-message)

(require 'straight-config)

;; Load Plugins
(setq plugins-file (concat user-emacs-directory "plugins/init.el"))
(load-file plugins-file)

(setq settings-file (concat user-emacs-directory "lisp/settings/init.el"))
(load-file settings-file)

