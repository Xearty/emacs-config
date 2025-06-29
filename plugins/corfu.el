(use-package corfu
  :custom
  (corfu-preview-current nil)    ;; Disable current candidate preview

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  :hook ((prog-mode . corfu-mode)
         (shell-mode . corfu-mode)
         (eshell-mode . corfu-mode))

  :init

  ;; Recommended: Enable Corfu globally.  Recommended since many modes provide
  ;; Capfs and Dabbrev can be used globally (M-/).  See also the customization
  ;; variable `global-corfu-modes' to exclude certain modes.
  (setq corfu-auto t
	corfu-auto-delay 0.25
	corfu-auto-prefix 3)

  (global-corfu-mode)

  ;; Enable optional extension modes:
  ;; (corfu-history-mode)
  ;; (corfu-popupinfo-mode)
  :config
  (keymap-set corfu-map "<remap> <keyboard-escape-quit>" nil))

;; A few more useful configurations...
(use-package emacs
  :straight (:type built-in)
  :custom
  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p))
