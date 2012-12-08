;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)
(setq backup-inhibited t)

(setq buffer-auto-save-file-name nil)

