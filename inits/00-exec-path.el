;; exec-path
(dolist (dir (list
      "/usr/local/bin"
      "/usr/bin"
      "/bin"))
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))
