(use-package doom-modeline
  :init
  (setq doom-modeline-hud t)
  (setq doom-modeline-buffer-modification-icon nil)
  ;; (setq doom-modeline-position-line-format nil)
  ;; (setq doom-modeline-position-column-format nil)
  ;; (setq doom-modeline-position-column-line-format nil)
  ;; (setq doom-modeline-percent-position nil)
  (setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))
  (setq doom-modeline-indent-info t)
  (setq doom-modeline-vcs-icon t)
  (setq doom-modeline-project-name t)
  :hook (after-init . doom-modeline-mode))
