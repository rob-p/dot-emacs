(global-font-lock-mode t)

;; Let's try out vimpule
(add-to-list 'load-path "~/dot-emacs/elisp-files")
(require 'vimpulse)

;; Color Themes
(add-to-list 'load-path "~/dot-emacs/elisp-files/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-wombat)))

;; ========== GIT Stuff ==========
(add-to-list 'load-path "~/dot-emacs/elisp-files/magit-0.8.2")
(require 'magit)
;; ========== GIT Stuff ==========

;; ========== Python Stuff ==========
;; Pymacs and Rope
(add-to-list 'load-path "~/dot-emacs/elisp-files/Pymacs-0.23")
(add-to-list 'load-path "~/dot-emacs/elisp-files/ropemacs")
(require 'pymacs)
(add-to-list 'pymacs-load-path "~/dot-emacs/elisp-files/ropemacs")
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)
(setq ropemacs-autoimport-modules '("os" "shutil" "argparse" "dendropy" "numpy" "scipy"))

;; Autocomplete
(add-to-list 'load-path "~/dot-emacs/elisp-files/auto-complete-1.3")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/dot-emacs/elisp-files/auto-complete-1.3/dict")
(ac-config-default)
(global-auto-complete-mode t)
;; ========== End of Python Stuff ==========


; What are these ?
(windmove-default-keybindings)
(setq use-file-dialog nil)

;; "y" or "n" instead of "yes" or "no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight regions and add special behaviors to regions.
;; "C-h d transient" for more info
(setq transient-mark-mode t)

;; Display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

(global-set-key "\C-c\C-w" 'backward-kill-word)

;; Allow us to switch to fullscreen
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
			 (if (equal 'fullboth current-value)
			     (if (boundp 'old-fullscreen) old-fullscreen nil)
			   (progn (setq old-fullscreen current-value)
				  'fullboth)))))

; Make new frames fullscreen by default. Note: this hook doesn't do
; anything to the initial frame if it's in your .emacs, since that file is
; read _after_ the initial frame is created.
;(add-hook 'after-make-frame-functions 'toggle-fullscreen)


;; ========== Scala Stuff ==========
(add-to-list 'load-path "~/dot-emacs/elisp-files/scala")
(require 'scala-mode-auto)

(defun scala-turn-off-indent-tabs-mode()
  (setq indent-tabs-mode nil))

;; Scala mode hooks
(add-hook 'scala-mode-hook 'scala-turn-off-indent-tabs-mode)

;; ---------- ENSIME Stuff ----------
(add-to-list 'load-path "~/dot-emacs/elisp-files/ensime_2.8.1.RC2-0.3.5/elisp/")
(require 'ensime)
(add-hook 'scala-hook-mode 'ensime-scala-hook-mode)

;; ---------- ENSIME Stuff ----------

;; ========== Scala Stuff ==========


;; YASNIPPIT
(add-to-list 'load-path "~/dot-emacs/elisp-files/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/dot-emacs/elisp-files/yasnippet-0.6.1c")
(add-hook 'scala-mode-hook
	  '(lambda ()
	     (yas/minor-mode-on)
	     ))

;; CEDET

(load "~/dot-emacs/elisp-files/cedet-1.0pre7/common/cedet.el")
(load "~/dot-emacs/elisp-files/cedet-1.0pre7/contrib/semantic-ectag-scala.el")
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu
(semantic-load-enable-primary-exuberent-ctags-support)

;; ECB
(add-to-list 'load-path
	     "~/dot-emacs/elisp-files/ecb-2.40")
(require 'ecb)

;; SBT
(load "~/dot-emacs/elisp-files/scala/sbt.el")

; ORGMODE
(setq load-path (cons "~/dot-emacs/elisp-files/org-6.36c/lisp" load-path))
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(global-font-lock-mode 1)
(add-hook 'org-mode-hook 'turn-on-font-lock)


;; REFTEX in org mode 
(defun org-mode-reftex-setup ()
(load-library "reftex")
(and (buffer-file-name)
(file-exists-p (buffer-file-name))
(reftex-parse-all))
(define-key org-mode-map (kbd "C-c )") 'reftex-citation) )
(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; Org directory stuff
(setq org-directory "~/Documents/org")
(setq org-mobile-inbox-for-pull "~/Documents/org/flagged.org")

;; MobileOrg directory stuff
(setq org-mobile-directory "~/Dropbox/MobileOrg")

; CMAKE
; Add cmake listfile names to the mode list.
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

(autoload 'cmake-mode "~/dot-emacs/elisp-files/cmake-mode.el" t)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(org-mobile-files (quote (org-agenda-files org-agenda-text-search-extra-files "~/Documents/org")))
 '(org-mobile-inbox-for-pull "~/Documents/org" t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
