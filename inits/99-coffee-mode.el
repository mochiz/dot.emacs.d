;; coffee-mode
;; git submodule add git://github.com/defunkt/coffee-mode vendor/coffee-mode
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(setq whitespace-action '(auto-cleanup)) ;; automatically clean up bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab)) ;; only show bad whitespace


(defun defunkt-coffee-mode-hook ()
  "defunkt's hacks and experiments for `coffee-mode.el'."

  ;; Compile .js on every save.
  ;;   (add-hook 'before-save-hook
  ;;             '(lambda ()
  ;;                (when (not (string= (buffer-name) "Cakefile"))
  ;;                  (shell-command "cake build"))))

  ;; aww yeah
  (define-key coffee-mode-map "\C-L" 'coffee-insert-console)

  ;; I like debug mode, sometimes.
  (setq coffee-debug-mode nil))

(add-hook 'coffee-mode-hook (lambda () (defunkt-coffee-mode-hook)))

(defadvice textmate-next-line (around coffee-tm-next-line)
  (interactive)
  (if (string= major-mode "coffee-mode")
      (progn
        (end-of-line)
        (coffee-newline-and-indent))
    ad-do-it))
(ad-activate 'textmate-next-line)

(defun coffee-insert-console ()
  (interactive)
  (insert "console.log "))
