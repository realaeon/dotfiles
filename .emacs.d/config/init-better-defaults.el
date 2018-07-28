(setq make-backup-files nil)
(setq auto-save-default nil)

;;org mode highlight
(setf org-src-fontify-natively t)
(global-hl-line-mode t)

;;enable mouse
;(require 'mouse)
;(xterm-mouse-mode t)

;;c intent
(setq-default c-basic-offset 4)

;;ui
(menu-bar-mode -1)
(show-paren-mode 1)
(setq visible-bell 1)

;(global-linum-mode 1)
(add-hook 'prog-mode-hook 'global-linum-mode)

;;To make system copy work with Emacs paste 
(setq x-select-enable-clipboard t)

;;cedet
(semantic-mode 1)
(global-ede-mode t)
(global-semanticdb-minor-mode 1)

;;proto
(define-derived-mode protobuf-mode c-mode
  "Protocol Buffer" "Major mode for editing Google Protocol Buffer files."
  (setq fill-column 80
	tab-width 4))
(add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode))

;;recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 25)



(provide 'init-better-defaults)
