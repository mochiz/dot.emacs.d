;; popwin.el
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
; for anything
(setq anything-samewindow nil)
(push '("*anything*" :regexp t :height 20) popwin:special-display-config)
(push '(" *my-anything-filelist+*" :height 30) popwin:special-display-config)
