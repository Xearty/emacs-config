(use-package evil
  :init
  (setq evil-want-C-u-delete t
	evil-want-C-u-scroll t
	evil-want-Y-yank-to-eol t)
  (setq evil-want-integration t  ;; These are needed for evil-collection
        evil-want-keybinding nil)
  :config
  (define-key evil-insert-state-map (kbd "C-h") 'backward-delete-char)
  (evil-set-undo-system 'undo-tree)
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-keypad
  :after evil
  :config
  (evil-keypad-global-mode 1))

(use-package undo-tree
  :config
  (global-undo-tree-mode))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))
