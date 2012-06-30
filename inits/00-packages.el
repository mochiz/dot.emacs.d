;; exec-path
(dolist (dir (list
      "/usr/local/bin"
      "/usr/bin"
      "/bin"))
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))

;; install-elisp
;; curl -O http://www.emacswiki.org/emacs/download/auto-install.el
(require 'auto-install)
(add-to-list 'load-path auto-install-directory)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;; add elpa package archives
(require 'package)
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/")
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; てきとーにバイトコンパイルしてくれる
;; M-x install-elisp-from-emacswiki RET auto-async-byte-compile.el RET
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "~/.emacs.d/inits/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
