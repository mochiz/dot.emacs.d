;; install-elisp
;; curl -O http://www.emacswiki.org/emacs/download/auto-install.el
(require 'auto-install)
(add-to-list 'load-path auto-install-directory)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)