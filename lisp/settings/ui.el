;; Disable UI
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Maximize on startup
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

(set-face-attribute 'default nil :family "JetBrains Mono" :height 110)

(setq use-dialog-box nil)

(setq visible-bell t)
(setq ring-bell-function 'ignore)
