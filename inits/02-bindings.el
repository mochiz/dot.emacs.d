;; Meta
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;; improve window move
(define-key global-map "\C-t" 'other-window)

;;; help key変更
;; BackSpaceをC-hに変更
;(load-library "obsolete/keyswap")
(global-set-key "\M-?" 'help-for-help)

;; keyswap は obsoleteなので以下の設定が良い
(global-set-key "\C-h" 'backward-delete-char)

; no mailing!
(global-unset-key (kbd "C-x m"))
(global-unset-key "\C-z")

;; no printing!
;; no changing meta key!!
(when (boundp 'osx-key-mode-map)
  ;; Option is my meta key.
  (define-key osx-key-mode-map (kbd "A-;")
    '(lambda () (interactive) (message "noop")))

  ;; What's paper?
  (define-key osx-key-mode-map (kbd "A-p")
    '(lambda () (interactive) (message "noop"))))

