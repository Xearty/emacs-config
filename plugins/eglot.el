(use-package eglot
  :straight nil
  :config
  (setq max-mini-window-height 1 ;; It would be helpful if for functions I get the signature and nothing else
	eldoc-echo-area-use-multiline-p nil
	eglot-put-doc-in-help-buffer 'eglot-doc-too-large-for-echo-area)
  (add-hook 'eglot-managed-mode-hook (lambda () (eglot-inlay-hints-mode -1))) 
  :hook ((rust-mode rust-ts-mode) . eglot-ensure)
  :bind ( :map rust-mode-map
	  ("C-c l i h" . eglot-inlay-hints-mode)))


