(package-initialize)

;;open init file
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/config/init-packages.el"))
(defun open-my-course-file()
  (interactive)
  (find-file "~/org/study.org"))


(add-to-list 'load-path "~/.emacs.d/config/")
(require 'init-packages)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)

(require 'dash)

(setq custom-file (expand-file-name "config/init-custom.el" user-emacs-directory))

(load-file custom-file)





