(require 'libs/vellum-orderless)

;;; Orderless completion style (and vellum-orderless.el)
(use-package orderless
  :demand t
  :after minibuffer
  :config
  ;; Remember to check my `completion-styles' and the
  ;; `completion-category-overrides'.
  (setq orderless-matching-styles '(orderless-prefixes orderless-regexp))
  (setq orderless-smart-case nil)

  ;; SPC should never complete: use it for `orderless' groups.
  ;; The `?' is a regexp construct.
  :bind ( :map minibuffer-local-completion-map
          ("SPC" . nil)
          ("?" . nil))
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package libs/vellum-orderless
  :straight nil
  :config
  (setq orderless-style-dispatchers
        '(vellum-orderless-literal
          vellum-orderless-file-ext
          vellum-orderless-beg-or-end)))
