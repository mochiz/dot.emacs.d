;; shell-command.el
(require 'shell-command)
(shell-command-completion-mode)

;; コントロールシーケンスを利用した色指定が使えるように
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)

(add-hook 'shell-mode-hook
          '(lambda ()
             ;; zsh のヒストリファイル名を設定
             (setq comint-input-ring-file-name "~/.zsh/.zsh_history")
             ;; ヒストリの最大数
             (setq comint-input-ring-size 1024)
             ;; 既存の zsh ヒストリファイルを読み込み
             (comint-read-input-ring t)
             ;; zsh like completion (history-beginning-search)
             (local-set-key "\M-p" 'comint-previous-matching-input-from-input)
             (local-set-key "\M-n" 'comint-next-matching-input-from-input)
             ;; 色の設定
             (setq ansi-color-names-vector
                   ["#000000"           ; black
                    "#ff6565"           ; red
                    "#93d44f"           ; green
                    "#eab93d"           ; yellow
                    "#204a87"           ; blue
                    "#ce5c00"           ; magenta
                    "#89b6e2"           ; cyan
                    "#ffffff"]          ; white
                   )
             (ansi-color-for-comint-mode-on)
             )
          )
