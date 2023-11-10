(require 'package)

;(add-to-list 'package-archives '("melpa-cn" . "http://elpa.codefalling.com/melpa/"))
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(defvar mypackages '(
		     use-package
		     company
		     hungry-delete
		     smartparens
		     ) "Default packages")
(defun mypackages-installed-p()
  (cl-loop for pkg in mypackages
	when (not (package-installed-p pkg)) do (return nil)
	finally (cl-return t)))

(unless (mypackages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg mypackages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
;;theme
(load-theme 'monokai t)

;;hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;;smartparens
(require 'smartparens-config)
(smartparens-global-mode t)


(use-package company
  :bind (:map company-active-map
	      ("C-n" . 'company-select-next)
	      ("C-p" . 'company-select-previous))
  :init
  (global-company-mode t)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0))

(use-package vertico
  :ensure t
  :init (vertico-mode t)  
  )


(use-package orderless
  :ensure t
  )
(setq completion-styles '(orderless))

(use-package marginalia
  :ensure t
  :init (marginalia-mode t)
  )



(use-package  embark
  :ensure t
  :init
  (setq prefix-help-command 'embark-prefix-help-command)
  (global-set-key (kbd "C-;") 'embark-act)
  )

;replace swiper
(use-package consult
  :ensure t
  :init (global-set-key (kbd "C-s") 'consult-line)
  )

(use-package embark-consult
  :ensure t
  )
(eval-after-load
    'consult
  '(eval-after-load
       'embark
     '(progn
	(require 'embark-consult)
	(add-hook
	 'embark-collect-mode-hook
	 #'consult-preview-at-point-mode))))
(define-key minibuffer-local-map (kbd "C-c C-e") 'embark-export-write)


;保存光标历史，记住上个命令
(use-package savehist
  ; 内置的包，源里没有
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300)
  )
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))



;显示文件行、列、大小 ，美化状态栏
;(use-package simple
;  :ensure nil
;  :hook (after-init . size-indication-mode)
;  :init
;  (progn
;    (setq column-number-mode t)
;    ))
;;modeline上显示我的所有的按键和执行的命令
;(use-package keycast :ensure t)
;(add-to-list 'global-mode-string '("" keycast-mode-line))
;(keycast-mode t)
;; 这里的执行顺序非常重要，doom-modeline-mode 的激活时机一定要在设置global-mode-string 之后‘
;(use-package doom-modeline
;  :ensure t
;  :init
;  (doom-modeline-mode t))


(use-package restart-emacs  :ensure t)

(provide 'init-packages)
