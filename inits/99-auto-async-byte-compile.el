;; てきとーにバイトコンパイルしてくれる
;; M-x install-elisp-from-emacswiki RET auto-async-byte-compile.el RET
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "~/.emacs.d/inits/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
