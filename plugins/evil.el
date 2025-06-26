(use-package evil
  :init
  (setq evil-want-C-u-delete t
	evil-want-C-u-scroll t
	evil-want-Y-yank-to-eol t)
  (setq evil-want-integration t  ;; These are needed for evil-collection
        evil-want-keybinding nil)

  ;; dired keybindings
  :bind (:map evil-normal-state-map
	      ("-" . dired-jump))
  :config
  ;; dired keybindings
  (evil-define-key 'normal dired-mode-map (kbd "h") 'dired-jump)
  (evil-define-key 'normal dired-mode-map (kbd "l") 'dired-find-file)

  ;; magit
  (add-hook 'git-commit-mode-hook 'evil-insert-state)

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
  (setq evil-keypad-activation-states '(normal visual))
  (evil-keypad-global-mode 1))

(use-package undo-tree
  :config
  (global-undo-tree-mode))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(defun vellum--with-underscore-as-word (original-function &rest args)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      (apply original-function args))))

(with-eval-after-load 'evil
  (let ((word-commands '(evil-inner-word
			 evil-forward-word-begin
			 evil-forward-word-end
			 evil-a-word
			 evil-backward-word-end
			 evil-backward-word-begin
			 evil-search-word-forward
			 evil-search-word-backward)))
    (dolist (command word-commands)
      (advice-add command :around #'vellum--with-underscore-as-word))))
