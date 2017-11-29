(global-set-key (kbd "<f12>") 'open-my-init-file)
(global-set-key (kbd "<f2>") 'open-my-course-file)
;;(global-set-key <super> 'open-my-course-file)


;;swiper
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c p f") 'counsel-git)

;;ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "<f3>")'recentf-open-files)


;;org
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)



(provide 'init-keybindings)
