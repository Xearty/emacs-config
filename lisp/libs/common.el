(defun vellum-common-kill-to-beginning-of-line ()
  "Kill text from point to the beginning of the current line.
The killed text is saved to the kill-ring."
  (interactive)
  (kill-region (point) (line-beginning-position)))

(provide 'libs/common)
