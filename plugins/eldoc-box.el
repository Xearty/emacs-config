(defun vellum-eldoc-box-scroll-up ()
  "Scroll up in `eldoc-box--frame'"
  (interactive)
  (with-current-buffer eldoc-box--buffer
    (with-selected-frame eldoc-box--frame
      (scroll-down 3))))
(defun vellum-eldoc-box-scroll-down ()
  "Scroll down in `eldoc-box--frame'"
  (interactive)
  (with-current-buffer eldoc-box--buffer
    (with-selected-frame eldoc-box--frame
      (scroll-up 3))))

(use-package eldoc-box
  :after evil-collection
  :config
  (with-eval-after-load 'evil-collection-eglot
    (evil-define-key 'normal 'eglot-mode-map (kbd "K") #'eldoc-box-help-at-point)
    (evil-define-key 'normal 'eglot-mode-map (kbd "M-p") #'vellum-eldoc-box-scroll-up)
    (evil-define-key 'normal 'eglot-mode-map (kbd "M-n") #'vellum-eldoc-box-scroll-down)
    (evil-define-key 'normal 'eglot-mode-map (kbd "C-g") #'eldoc-box-quit-frame)
    (evil-define-key 'normal 'eglot-mode-map (kbd "<escape>") #'eldoc-box-quit-frame)))
