 (setq exec-path (cons (expand-file-name "~/.rbenv/versions/2.0.0-preview1/bin") exec-path))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
