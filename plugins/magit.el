(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(unless (package-installed-p 'magit)
  (package-install 'magit))

(require 'magit)
