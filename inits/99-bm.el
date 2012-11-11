;; bm.el
(autoload 'bm-toggle   "bm" "Toggle bookmark in current buffer." t)
(autoload 'bm-next     "bm" "Goto bookmark."                     t)
(autoload 'bm-previous "bm" "Goto previous bookmark."            t)
(global-set-key "\M-1" 'bm-toggle)
(global-set-key "\M-2" 'bm-previous)
(global-set-key "\M-3" 'bm-next)
