;; slim down config
;;;;;;;;;;;;;;;;;;;

;; turn on server
(server-start)

;; turning off back-ups
(setq make-backup-files nil)

;; configure scratch settings
(setq initial-scratch-message nil)
(setq initial-major-mode 'org-mode)

;; change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; turn off the annoying bell sound
(setq visiable-bell t)
(setq ring-bell-function 'ignore)

;; UI related
;;;;;;;;;;;;;

;; turn on column number in status bar
(setq column-number-mode t)

;; set cursor to underline
(setq cursor-type 'hbar)

;; enable theme when using GUI
(when (display-graphic-p)
  (load-theme 'misterioso))

(setq inhibit-startup-screen t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)


;; setup package manager and use-package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;(use-package helm
;;  :ensure t
;;  :bind (("C-x C-f" . 'helm-find-files)
;;		 ("C-x r l" . 'helm-bookmarks))
;;  :config
;;  (helm-mode 1))

(use-package magit
  :ensure t
  :bind (("C-M-g" . magit-status)))


;; Programming
;;;;;;;;;;;;;;

;; ansi-term settings
;; set default shell
(global-set-key (kbd "C-c a") 'ansi-term)
(setq explicit-shell-file-name "/opt/homebrew/bin/bash")

;; ansi-term kill buffer when I exit function
(defun oleh-term-exec-hook ()
  (let* ((buff (current-buffer))
         (proc (get-buffer-process buff)))
    (set-process-sentinel
     proc
     `(lambda (process event)
        (if (string= event "finished\n")
            (kill-buffer ,buff))))))

(add-hook 'term-exec-hook 'oleh-term-exec-hook)

;; line numbers in promgramming modes
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; some python mode settings
(add-hook 'python-mode-hook
	    (lambda ()
		    (setq-default indent-tabs-mode t)
		    (setq-default tab-width 4)
		    (setq-default py-indent-tabs-mode t)
		    (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; some c settings
(add-hook 'c-mode-hook
	  (lambda ()
	  (font-lock-mode -1)
	  (setq c-default-style "linux"
		c-basic-offset 4)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(helm magit use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
