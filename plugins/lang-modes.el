(use-package rust-mode
  :init
  (setq rust-mode-treesitter-derive t))

(use-package typescript-ts-mode
  :straight (:type built-in)
  :defer t
  :mode "\\.tsx?\\'")
