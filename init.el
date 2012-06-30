;;; -*- mode: emacs-lisp; indent-tabs-mode: nil -*-
;; Emacs 設定ディレクトリを設定。
(let ((default-directory "~/.emacs.d/"))
  (setq load-path (cons default-directory load-path))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path "~/.emacs.d/vendor/")
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

