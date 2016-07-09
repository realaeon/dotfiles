;;org-mode
;;(add-to-list 'load-path "~/.emacs.d/elpa/org-8.3.4/lisp/")
(require 'org)
(setq org-log-done t) 
(setq org-agenda-files (list "~/org/notes.org"
			     "~/org/study.org"))
(setq org-src-fontify-natively t)
;capture
(setq org-default-notes-file (concat org-directory "/notes.org"))

(provide 'init-org)
