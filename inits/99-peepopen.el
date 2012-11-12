;; peepopen
(require 'textmate)
(add-to-list 'load-path "~/.emacs.d/vendor/")
(require 'peepopen)
(textmate-mode)

;; transpose-wordsは邪魔なので peepopenにしてしまう
(global-set-key "\M-t" 'peepopen-goto-file-gui)

