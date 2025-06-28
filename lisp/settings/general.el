(save-place-mode 1)
(global-auto-revert-mode 1)

(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)
(setq global-auto-revert-non-file-buffers t)

(setq read-file-name-completion-ignore-case t)

(setq inhibit-startup-screen t)

(add-hook 'prog-mode-hook (lambda ()
			    (visual-line-mode -1)
			    (toggle-truncate-lines 1)))
(setq create-lockfiles nil)
