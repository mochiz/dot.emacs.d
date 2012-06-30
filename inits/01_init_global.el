;;; -*- mode: emacs-lisp; indent-tabs-mode: nil -*-

;;; init_global.el --- global

;;init.el -- Emacs init setting elisp file
(setq user-full-name "mochiz")
(setq user-mail-address "mochi.hiro43@gmail.com")

;; 常時デバッグ状態
(setq debug-on-error t)

;; 文字コード
;;(set-language-environment 'Japanese)
(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8-unix)

;; ウィンドウの設定
(if window-system 
    (progn
      (setq initial-frame-alist
            '((width . 80) (height . 50)))
      (set-background-color "Black")
      (set-foreground-color "White")
      (set-cursor-color "Gray")
      (set-frame-parameter nil 'alpha 85)))

;; ログの長さを無限に
(setq message-log-max 't)
;; ログを出さない
;; (setq message-log-max nil)

;; hide toolbar
(tool-bar-mode 0)

;; 警告を視覚的にする
(setq visible-bell t)

;; ファイルを編集した場合コピーにてバックアップする
;; inode 番号を変更しない
(setq backup-by-copying t)

;;; バックアップファイルの保存位置指定[2002/03/02]
;; !path!to!file-name~ で保存される
(setq backup-directory-alist
      '(
        ("^/etc/" . "~/.emacs.d/var/etc")
        ("." . "~/.emacs.d/var/emacs")
        ))

;; emacsclient を利用するためにサーバ起動
;; サーバが起動していた場合は先に起動していた方を優先
;; (require 'server)
;; (unless (server-running-p) (server-start))
;; (setq server-visit-hook
;;       '(lambda () 
;;          ;; Frame を前面にする
;;          (raise-frame (selected-frame))
;;          ;; キーボードフォーカスを選択しているFrameにする
;;          (x-focus-frame (selected-frame))))

;;起動時のmessageを表示しない
(setq inhibit-startup-message t)

;; scratch のメッセージを空にする
(setq initial-scratch-message nil)

; 印刷の設定
(setq ps-multibyte-buffer 'non-latin-printer)

; 自動改行関連
(setq-default auto-fill-mode nil)
(setq-default fill-column 300)
(setq text-mode-hook 'turn-off-auto-fill)

; 削除ファイルをOSのごみ箱へ
;(setq delete-by-moving-to-trash t)


;; 編集関連

;; モードラインにライン数、カラム数表示
(line-number-mode t)
(column-number-mode t)

;; リージョンを kill-ring に入れないで削除できるようにする
(delete-selection-mode t)

;; TAB はスペース 2 個ぶんを基本
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 2)


;; 対応するカッコを色表示する
;; 特に色をつけなくてもC-M-p、C-M-n を利用すれば対応するカッコ等に移動できる
(show-paren-mode t)
;; カッコ対応表示のスタイル
;; カッコその物に色が付く(デフォルト)
;; (setq show-paren-style 'parenthesis)
;; カッコ内に色が付く
;; (setq show-paren-style 'expression)
;; 画面内に収まる場合はカッコのみ、画面外に存在する場合はカッコ内全体に色が付く
;; (setq show-paren-style 'mixed)

;;動的略語展開で大文字小文字を区別
(setq dabbrev-case-fold-search nil)

;;新規行を作成しない
;;emacs21ではデフォルトで設定されています。
;; (setq next-line-add-newlines nil)

;; スクロールのマージン
;; 一行ずつスクロールする
(setq scroll-conservatively 35)
(setq scroll-margin 0)
(setq scroll-step 1)
(setq comint-scroll-show-maximum-output t)
;(setq next-screen-context-lines 3)

;; 終了時に聞く
(setq confirm-kill-emacs 'y-or-n-p)

;; 安全な実行のための共通系関数

;; @see http://www.sodan.org/~knagano/emacs/dotemacs.html
(defmacro eval-safe (&rest body)
  "安全な評価。評価に失敗してもそこで止まらない。"
  `(condition-case err
       (progn ,@body)
     (error (message "[eval-safe] %s" err))))
(defun load-safe (loadlib)
  "安全な load。読み込みに失敗してもそこで止まらない。"
  ;; missing-ok で読んでみて、ダメならこっそり message でも出しておく
  (let ((load-status (load loadlib t)))
    (or load-status
        (message (format "[load-safe] failed %s" loadlib)))
    load-status))
(defun autoload-if-found (functions file &optional docstring interactive type)
  "set autoload iff. FILE has found."
  (if (not (listp functions))
      (setq functions (list functions)))
  (and (locate-library file)
       (progn
         (dolist (function functions)
           (autoload -file-name)) (flymake-mode))
    ;; エラー行で C-c d するとエラーの内容をミニバッファで表示する
    (define-key ruby-mode-map "\C-cd" 'credmp/flymake-display-err-minibuf)))

(defun credmp/flymake-display-err-minibuf ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no (flymake-current-line-no))
         (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count (length line-err-info-list))
         )
    (while (> count 0)
      (when line-err-info-list
        (let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file (flymake-ler-full-file (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)
          )
        )
(setq count (1- count)))))

;; textexpander
(setq ns-alternate-modifier 'alt)
(define-key global-map [(alt ?v)] 'scroll-down)
(define-key global-map [(meta ?v)] 'yank)


;; ack
(defun ack ()
  (interactive)
  (let ((grep-find-command "ack --nocolor --nogroup "))
    (call-interactively 'grep-find)))




