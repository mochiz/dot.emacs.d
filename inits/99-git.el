(delete 'Git vc-handled-backends)

;; git-status
;; git submodule add git://gist.github.com/546654 vendor/git-status
(add-to-list 'load-path "~/.emacs.d/vendor/git-status")
(require 'git-status)
(eval-after-load 'magit
  '(progn
     (set-face-background 'magit-item-highlight "#202020")
     (set-face-foreground 'magit-diff-add "#40ff40")
     (set-face-foreground 'magit-diff-del "#ff4040")
     (set-face-foreground 'magit-diff-file-header "#4040ff")))
