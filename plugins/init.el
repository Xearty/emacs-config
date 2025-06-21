(setq package-archives
'(
   ("org" . "https://orgmode.org/elpa/")
   ("gnu" . "https://elpa.gnu.org/packages/")
   ("melpa" . "https://melpa.org/packages/")
))

(require 'libs/plugin-utils)
(load-plugins (file-name-directory load-file-name))
