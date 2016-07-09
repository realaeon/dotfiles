(global-set-key (kbd "<f12>") 'open-my-init-file)
(global-set-key (kbd "<f2>") 'open-my-course-file)
;;(global-set-key <super> 'open-my-course-file)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c p f") 'counsel-git)

;;ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "<f3>")'recentf-open-files)

;;helm-tags
(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-c g s") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c g p") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c g n") 'helm-gtags-next-history)

;;org
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)



(provide 'init-keybindings)
