(require 'eieio)

(defclass themes-view ()
  ((themes :initarg :themes
	   :initform '()
	   :type list
	   :accessor themes-view-get-themes
	   :documentation "The list of themes in the theme variant")
   (index :initform 0
	  :type integer
	  :accessor themes-view-get-index
	  :documentation "The index in themes that is currently used")))

(defun make-themes-view (themes)
  (make-instance 'themes-view :themes themes))

(let ((dark-themes '(doom-sourcerer
		     doom-lantern
		     doom-moonlight
		     doom-city-lights))
      (light-themes '(doom-gruvbox-light
		      doom-feather-light
		      doom-one-light))
      (modus-dark-themes '(modus-vivendi
			   modus-vivendi-tinted
			   modus-vivendi-tritanopia
			   modus-vivendi-deuteranopia))
      (modus-light-themes '(modus-operandi
			    modus-operandi-tinted
			    modus-operandi-tritanopia
			    modus-operandi-deuteranopia)))
  (setq vellum-themes-variants-alist
	`((dark . ,(make-themes-view dark-themes))
	  (light . ,(make-themes-view light-themes))
	  (modus-dark . ,(make-themes-view modus-dark-themes))
	  (modus-light . ,(make-themes-view modus-light-themes)))))

(setq vellum-current-theme-variant 'dark)

(defun vellum-clean-load-theme (theme)
  "Disable all other themes and then load THEME."
  (interactive
   (list (intern (completing-read "Load theme: " (custom-available-themes)))))
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme theme t))
(defun vellum-get-selected-theme-alist-entry ()
  (assoc
   vellum-current-theme-variant
   vellum-themes-variants-alist))

(defun vellum-get-selected-variant-themes-view ()
  (cdr (vellum-get-selected-theme-alist-entry)))

(defun vellum-get-selected-theme ()
  (let* ((current-variant-themes-view (vellum-get-selected-variant-themes-view))
	 (index (themes-view-get-index current-variant-themes-view))
	 (themes (themes-view-get-themes current-variant-themes-view)))
    (nth index themes)))

(defun vellum-cycle-themes ()
  "Cycles through the themes in the set of themes defined
by `vellum-themes-variants-alist`. Current variant is defined
in `vellum-current-theme-variant`. The next theme is set by
calling `vellum-clean-load-theme`"
  (interactive)
  (let* ((current-variant-themes-view (vellum-get-selected-variant-themes-view))
	 (index (themes-view-get-index current-variant-themes-view))
	 (themes (themes-view-get-themes current-variant-themes-view))
	 (next-index (% (+ index 1)
			(length themes)))
	 (next-theme (nth next-index themes)))
    (vellum-clean-load-theme next-theme)
    (oset current-variant-themes-view index next-index)))

(defun vellum-change-theme-variant (variant)
  (interactive (list
		(intern (completing-read
			 "Select theme variant: "
			 (mapcar 'car vellum-themes-variants-alist)))))
  (setq vellum-current-theme-variant variant)
  (vellum-refresh-theme))

(defun vellum-refresh-theme ()
  (let ((selected-theme (vellum-get-selected-theme)))
    (vellum-clean-load-theme selected-theme)))

(keymap-global-set "C-c t c" #'vellum-cycle-themes) ;; Cycle theme
(keymap-global-set "C-c t v" #'vellum-change-theme-variant) ;; Change theme variant

(vellum-refresh-theme)
