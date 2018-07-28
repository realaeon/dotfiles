;;org-mode
(require 'org)
(setq org-log-done t) 
(setq org-agenda-files (list "~/org/notes.org"
			     ;"~/org/study.org"
			     ))
(setq org-src-fontify-natively t)

;;latex中文支持

(setq org-latex-pdf-process
     '("xelatex -interaction nonstopmode %f"
     "xelatex -interaction nonstopmode  %f"
    "xelatex -interaction nonstopmode  %f"))

;capture
(setq org-default-notes-file (concat org-directory "/notes.org"))
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))


(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n@)" "|" "DONE(d@)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
	      )))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

; Tags with fast selection keys
(setq org-tag-alist (quote ((:startgroup)
                            ("@HOME" . ?h)
                            ("@WORK" . ?w)
                            ("@RESEARCH" . ?r)
                            (:endgroup)
                            ("WAITING" . ?W)
                            ("HOLD" . ?H)
			    ("PERSONAL" . ?P)
                            ("SKILL" . ?s)
                            ("CANCELLED" . ?c)
                            ("FLAGGED" . ??))))

(setq org-agenda-custom-commands
      '(("w" tags-todo "+@WORK")
	("h" tags-todo "+@HOME")
        ("r" tags-todo "+@RESEARCH")
	))


;; Capture templates 
(setq org-capture-templates
      (quote (;("t" "todo" entry (file "~/org/notes.org")"* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
	      ;("t" "todo" entry (file "~/org/notes.org")"** TODO %?\n%i\n")
	      ("t" "todo" entry (file+olp "~/org/notes.org" "Tasks")"** TODO %?\n\%i\n" )
	      )))

(provide 'init-org)
