(defun vellum-orderless-literal (word _index _total)
  "Read WORD= as a literal string."
  (when (string-suffix-p "=" word)
    ;; The `orderless-literal' is how this should be treated by
    ;; orderless.  The `substring' form omits the `=' from the
    ;; pattern.
    `(orderless-literal . ,(substring word 0 -1))))

(defun vellum-orderless-file-ext (word _index _total)
  "Expand WORD. to a file suffix when completing file names."
  (when (and minibuffer-completing-file-name
             (string-suffix-p "." word))
    `(orderless-regexp . ,(format "\\.%s\\'" (substring word 0 -1)))))

(defun vellum-orderless-beg-or-end (word _index _total)
  "Expand WORD~ to \\(^WORD\\|WORD$\\)."
  (when-let* (((string-suffix-p "~" word))
              (word (substring word 0 -1)))
    `(orderless-regexp . ,(format "\\(^%s\\|%s$\\)" word word))))

(provide 'libs/vellum-orderless)
