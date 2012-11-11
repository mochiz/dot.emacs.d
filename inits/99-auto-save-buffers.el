;; http://0xcc.net/misc/auto-save/auto-save-buffers.el
;; auto-save-buffers
(require 'auto-save-buffers)
(run-with-idle-timer 1 t 'auto-save-buffers)
