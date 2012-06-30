;; Ricty を使う
(set-face-attribute 'default nil
                    :family "Ricty"
                    :height 140)
(set-fontset-font
 nil
 'japanese-jisx0208
 (font-spec :family "Ricty"))
(set-fontset-font
 nil
 'japanese-jisx0212
 (font-spec :family "Ricty"))

;; フォントサイズ変更の割合
;; (setq face-font-rescale-alist
;;       '(("^-apple-hiragino.*" . 1.2)))
