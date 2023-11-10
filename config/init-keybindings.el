(setq mac-option-modifier 'meta
      mac-command-modifier 'super)

(global-set-key (kbd "s-a") 'mark-whole-buffer) ;;对应Windows上面的Ctrl-a 全选
(global-set-key (kbd "s-c") 'kill-ring-save) ;;对应Windows上面的Ctrl-c 复制
(global-set-key (kbd "s-s") 'save-buffer) ;; 对应Windows上面的Ctrl-s 保存
(global-set-key (kbd "s-v") 'yank) ;对应Windows上面的Ctrl-v 粘贴
(global-set-key (kbd "s-z") 'undo) ;对应Windows上面的Ctrol-z 撤销
(global-set-key (kbd "s-x") 'kill-region) 
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
;(define-key global-map "\C-c." 'org-time-stamp)
(global-set-key (kbd "C-c C-.") 'org-time-stamp)



(provide 'init-keybindings)
