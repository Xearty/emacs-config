(setq backup-directory-alist '((".*" . "~/.Trash")))

(ido-mode t)
(save-place-mode 1)
(global-auto-revert-mode 1)

(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)
(setq global-auto-revert-non-file-buffers t)
