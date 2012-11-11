;; ウィンドウの設定
(if window-system 
    (progn
      (setq initial-frame-alist
            '((top . 1) (width . 95) (height . 48)))
      (set-background-color "Black")
      (set-foreground-color "White")
      (set-cursor-color "Gray")
      ;; hide scrollbar
      (set-scroll-bar-mode nil)
      ;; hide toolbar
      (tool-bar-mode 0)
      (set-frame-parameter nil 'alpha 85)))

;; WindMove
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))
(setq windmove-wrap-around t)

;; ダイアログは出さない
(setq use-dialog-box nil)
(defalias 'message-box 'message)

;; D&D で新しくフレームを作らない
(setq ns-pop-up-frames nil)

;; 起動時のメッセージを消す
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)

;; タイトルフォーマット
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;; 時間表示の変更
(progn
  (setq display-time-24hr-format t)
  (setq display-time-format "%Y-%m-%d(%a) %H:%M")
  (setq display-time-day-and-date t)
  (setq display-time-interval 30)
  (display-time))

;; 縦分割でも折り返す
(setq truncate-partial-width-windows nil)

;; C-kで行全体を削除
(setq kill-whole-line t)

;; 矩形モード
(cua-mode t)
(setq cua-enable-cua-keys nil) ;; 変なキーバインド禁止

;;; 縦二分割 (IMAKADOスタイル)
;; (split-window-horizontally)

;; カーソル移動位置の繰り返しを拡張
;; 
(require 'sequential-command-config)
(sequential-command-setup-keys)

;; 同じファイル名の表示を見やすく
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
