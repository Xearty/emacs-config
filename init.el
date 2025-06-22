(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'straight-config)

;; Load Plugins
(setq plugins-file (concat user-emacs-directory "plugins/init.el"))
(load-file plugins-file)

(setq settings-file (concat user-emacs-directory "lisp/settings/init.el"))
(load-file settings-file)

