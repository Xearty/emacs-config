(require 'treesit) ; (treesit-ready-p)

(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash" "v0.23.3")
     (rust "https://github.com/tree-sitter/tree-sitter-rust" "v0.23.0")
     (json "https://github.com/tree-sitter/tree-sitter-json" "v0.24.8")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "v0.23.2")
     (toml "https://github.com/tree-sitter/tree-sitter-toml" "v0.5.1")))

; Lazy installing of language grammars
(dolist (source treesit-language-source-alist)
  (unless (treesit-ready-p (car source))
    (treesit-install-language-grammar (car source))))

; Evaluate to install language grammars forcefully
; (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))
