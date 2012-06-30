;; javascript mode
;; install from epla
(require 'js2-mode)
(defun javascript-custom ()
  "javascript-mode-hook"
  (set (make-local-variable 'tab-width) 2))
(add-hook 'javascript-mode-hook
          '(lambda() (javascript-custom)))
