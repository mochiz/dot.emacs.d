;; session.el
;; http://www.emacswiki.org/emacs/session.el
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
;; セッション情報を保存するディレクトリ
;; (setq session-save-file (concat user-emacs-directory "session"))
;; (setq session-save-file "~/.emacs.d/session")
;; ファイルを前回保存した時ではなく、閉じた時のカーソル位置を記録する
(setq session-undo-check -1)
;; M-x で実行したコマンド履歴の保存件数
(setq history-length 1000000)
(setq session-initialize '(de-saveplace session menus places))
;; セッション管理する情報の設定
(setq session-globals-include '((kill-ring 100)            ;; キルリング100件
                                (session-file-alist 100 t) ;; カーソル位置100箇所
                                (session-globals-max-size 100000)
                                (file-name-history 300)))  ;; 開いたファイルのパス300件
