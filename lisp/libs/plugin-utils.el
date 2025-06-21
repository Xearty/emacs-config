(defun load-file-plugin (path)
  "Load plugin from file"
  (message "load-file-plugin: %s" path)
  (load (file-name-sans-extension path)))

(defun load-directory-plugin (path)
  "Load plugin from directory path, containing a file named `init.el`"
  (message "load-directory-plugin: %s" path)
  (let ((init-file-path (concat (file-name-as-directory path) "init.el")))
    (if (file-exists-p init-file-path)
	(load init-file-path)
	(message "Error while loading plugin: `%s` doesn't exist" init-file-path))))

(defun load-plugin (directory plugin-name)
  (let* ((path (concat (file-name-as-directory directory) plugin-name))
	 (attributes (file-attributes path))
	 (is-dir (eq (car attributes) t)))
    (if is-dir
	(load-directory-plugin path)
        (load-file-plugin path))))

(defun junk-file-p (file)
  (or (string= "." file)
      (string= ".." file)
      (backup-file-name-p file)
      (auto-save-file-name-p file)
      (string-prefix-p ".#" file))) ;; Also check for lockfiles, which start with .#

(defun ignore-file-p (file)
  (or (junk-file-p file)
      (member file '("init.el"))))

(defun load-plugins (directory)
  "Load all plugins in `directory`."
  (let* ((all-files (directory-files directory))
	 (plugin-files (seq-remove #'ignore-file-p all-files)))
  (dolist (relpath plugin-files) (load-plugin directory relpath))))

(provide 'libs/plugin-utils)
