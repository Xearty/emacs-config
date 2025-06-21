(let ((current-dir (file-name-directory load-file-name))
      (modules '("ui.el" "general.el")))
  (dolist (module modules) (load-file (concat current-dir module))))
      
