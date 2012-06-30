;; javascript mode
;; install from epla
(add-to-list 'load-path "~/.emacs.d/vendor/js2-mode")
(require 'js2-mode)
(defun javascript-custom ()
  "javascript-mode-hook"
  (set (make-local-variable 'tab-width) 2))
(add-hook 'javascript-mode-hook
          '(lambda() (javascript-custom)))
(add-to-list 'auto-mode-alist '("\\.\\(js\\|json\\)$" . js2-mode))
