;; markdown-mode
;; install from elpa
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.\\(text\\|md\\)$" . markdown-mode))
