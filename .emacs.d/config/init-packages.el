(require 'cl)
(require 'package)

;(add-to-list 'package-archives '("melpa-cn" . "http://elpa.codefalling.com/melpa/"))
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(defvar mypackages '(company
		     company-irony-c-headers
		     irony
		     company-irony
		     ;company-jedi
		     dash
		     monokai-theme
		     jdee
		     hungry-delete
		     swiper
		     counsel
		     smartparens
		     helm
		     cmake-mode
		     ;;python ide
		     elpy
		     ;rtags
		     ;company-rtags
		     helm-gtags
		     markdown-mode
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

;;python
(elpy-enable)
;;elpy fix
;(elpy-use-ipython ''ipython3)
(defun python-shell-completion-native-try ()
  "Return non-nil if can trigger native completion."
  (with-eval-after-load 'python
    (let ((python-shell-completion-native-enable t)
	  (python-shell-completion-native-output-timeout
	   python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_")))
  )


;;theme
(load-theme 'monokai t)

;;hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;;swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;;smartparens
(require 'smartparens-config)
(smartparens-global-mode t)


;;
;;company-mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-dabbrev)
(require 'company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list 'company-backends '(company-irony-c-headers company-irony)))

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)

;;irony
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


;;common lisp
(setq inferior-lisp-program "/bin/sbcl")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
(require 'slime)
(slime-setup)

;;helm
(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t)
(require 'helm-gtags)
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)





(provide 'init-packages)
