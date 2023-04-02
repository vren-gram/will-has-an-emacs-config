(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(elfeed magit with-editor company cmake-mode irony lsp-mode websocket org-roam dired-launch amx yasnippet yafolding ws-butler which-key vterm visual-fill-column valign use-package typescript-mode smartparens rainbow-delimiters pyvenv python-mode pdf-tools paredit org-tree-slide org-roam-ui org-drill org-download org-bullets ob-spice no-littering mu4e-alert mpv math-symbol-lists lsp-ui lsp-treemacs lsp-ivy ivy-prescient ivy-fuz helpful ggtags fuzzy forge flyspell-correct-ivy flycheck eterm-256color esup eshell-git-prompt elfeed-goodies doom-themes doom-modeline djvu dired-single dired-open dired-hide-dotfiles cpputils-cmake cpp-auto-include counsel-projectile company-irony company-c-headers company-box command-log-mode cmake-project cmake-ide cmake-font-lock clean-aindent-mode auto-package-update auctex-latexmk all-the-icons-ivy-rich all-the-icons-ivy all-the-icons-ibuffer all-the-icons-dired ac-ispell)))


(setq custom-safe-themes
      '("7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" default))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:foreground "#676E95" :strike-through nil :underline nil :slant normal :weight normal :height 1.0 :width normal :family "Hack"))))
 '(line-number-current-line ((t (:foreground "#676E95" :strike-through nil :underline nil :slant normal :weight normal :height 1.0 :width normal :family "Hack"))))
 '(mu4e-compose-header-face ((t (:inherit message-separator :foreground "white" :slant italic))))
 '(mu4e-ok-face ((t (:inherit font-lock-comment-face :foreground "medium spring green" :slant normal :weight bold))))
 '(trailing-whitespace ((t (:background "dim gray"))))
 '(whitespace-big-indent ((t (:background "black" :foreground "firebrick")))))

;; ============================================================
;; startup-vars
(setq gc-cons-threshold (* 50 1000 1000))
(setq word-wrap t)
;; visual things
(setq visible-cursor nil)
(setq blink-cursor-mode nil)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(setq standard-indent 2)
(setq visible-bell nil)
(setq indicate-buffer-boundaries nil)
;; ============================================================
;; Default UI
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq inhibit-startup-buffer-menu t)
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(menu-bar-mode -1)            ; Disable the menu bar
;; default transparency settings
(setq default-frame-alist '((alpha 100 . 100)))
;; ============================================================
;; initial buffer things
(setq initial-buffer-choice "")
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message "")

;; ============================================================
;; misc
(setq column-number-mode t)
(setq confirm-kill-processes nil)
(setq large-file-warning-threshold nil)
(setq linum-format 'dynamic) 
(setq case-replace t)
(setq column-number-mode t)
(setq resize-mini-windows t)
(setq confirm-kill-processes nil)
(setq byte-compile-warnings '(cl-functions))

;; ============================================================
;; backups
(setq
  backup-by-copying t      ; don't clobber symlinks
  backup-directory-alist
  '(("." . "~/.emacs.d/.saves"))    ; don't litter my fs tree
  delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)       ; use versioned backups

;; ============================================================
;;scroll-vars
(setq scroll-conservatively 1000)
(setq scroll-down-aggressively 0.01)
(setq scroll-margin 2)
(setq scroll-preserve-screen-position nil)
(setq scroll-step 1)
(setq scroll-up-aggressively 0.01)
(setq next-screen-context-lines 2)
(setq overline-margin 20)
;; ============================================================
;;disp line numbers
(global-display-line-numbers-mode t)
(setq display-line-numbers-grow-only t)
(setq display-line-numbers-widen t)
(setq display-line-numbers-width-start 2)
(setq display-line-numbers-width 2)
;; ============================================================
;; indent and tabs
(setq indent-tabs-mode nil)
(setq electric-indent-mode nil)
(setq backward-delete-char-untabify-method 'hungry)
;;Create a variable for our preferred tab width
(setq custom-tab-width 4)
;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)
;;Making electric-indent behave sanely
(setq-default electric-indent-inhibit t)
;; Visualize tabs as a pipe character - "|"
;; This will also show trailing characters as they are useful to spot.
(setq whitespace-style '(face tabs tab-mark trailing))
(setq whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9]))) ;;124 is the ascii ID for '\|'

;; ============================================================
;; font-config
(defvar will/default-font-size 120)
(defvar will/default-variable-font-size 150)

(set-face-attribute 'default nil 
                    :font "Hack"  
                    :height will/default-font-size)

(set-face-attribute 'fixed-pitch nil 
                    :font "SF Mono" 
                    :height will/default-font-size)

(set-face-attribute 'variable-pitch nil 
                    :font "Noto Sans" 
                    :height will/default-variable-font-size 
                    :weight 'light)

;; ============================================================
;; custom functions
(defun toggle-window-split () (interactive)
    (if (= (count-windows) 2)
    (let* ((this-win-buffer (window-buffer))
        (next-win-buffer (window-buffer (next-window)))
        (this-win-edges (window-edges (selected-window)))
        (next-win-edges (window-edges (next-window)))
        (this-win-2nd (not (and (<= (car this-win-edges)
        (car next-win-edges))
        (<= (cadr this-win-edges)
        (cadr next-win-edges)))))
        (splitter
        (if (= (car this-win-edges)
            (car (window-edges (next-window))))
            'split-window-horizontally
            'split-window-vertically)))
    (delete-other-windows)
        (let ((first-win (selected-window)))
        (funcall splitter)
        (if this-win-2nd (other-window 1))
        (set-window-buffer (selected-window) this-win-buffer)
        (set-window-buffer (next-window) next-win-buffer)
        (select-window first-win)
    (if this-win-2nd (other-window 1))))))


(defun will/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
    (format "%.2f seconds" 
    (float-time 
     (time-subtract after-init-time before-init-time)))
    gcs-done))

;; display startup time to user
(add-hook 'emacs-startup-hook #'will/display-startup-time)

;; ============================================================
;; global-keybindings
(define-key global-map (kbd "C-x C-n") 'next-buffer)
(define-key global-map (kbd "C-x C-p") 'previous-buffer)
(define-key global-map (kbd "C-x C-o") 'other-window)
(define-key global-map (kbd "C-x C-k") 'kill-this-buffer)

(global-set-key (kbd "C-x 4") 'toggle-window-split)
(global-set-key (kbd "C-x 6") 'window-swap-states)
(global-set-key (kbd "C-x C-5") 'toggle-frame-fullscreen)

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

(global-set-key (kbd "C-q") 'c-hungry-delete-forward)

;; buffer resizing
(global-set-key (kbd "C-M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-<down>") 'shrink-window)
(global-set-key (kbd "C-M-<up>") 'enlarge-window)

(global-set-key (kbd "C-x C-d") 'dired)

;; ============================================================
;; whitelisted command
(put 'dired-find-alternate-file 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)



;; ============================================================
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless package-archive-contents (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


(use-package auto-package-update
  :custom
  (auto-package-update-interval 30) ; 30 days
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

;; ============================================================
(use-package no-littering)

;; mb broken tag
(use-package server
  :init
  (add-hook 'after-init-hook
            (lambda () (unless (or noninteractive (server-running-p))
                         (server-start)))))

(use-package clean-aindent-mode
  :hook prog-mode)

(use-package rainbow-delimiters
  :hook prog-mode)

(use-package command-log-mode
  :commands command-log-mode)

;; ============================================================
(use-package doom-themes
  :init (load-theme 'doom-palenight t)
  :after all-the-icons)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom ((doom-modeline-height 15)))

;; ============================================================
(use-package which-key
    :defer 0
    :diminish which-key-mode
    :config
        (setq which-key-mode t)
        (setq which-key-idle-delay 1))

;; ============================================================
;; ivy
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
		 :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
		 :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
		 :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (setq ivy--regex-function 'ivy--regex-plus)
  ;; (setq ivy--regex-function 'ivy--regex-plus)
  (ivy-mode 1))

(use-package flyspell-correct-ivy)

;; necessary for ivy to work
(use-package swiper 
  :after ivy
  :ensure t)

(use-package counsel
  :bind 
    (("C-x b" . counsel-switch-buffer)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c C-f" . counsel-ag)
	 ("M-x" . counsel-M-x)
     :map minibuffer-local-map
       ("C-r" . 'counsel-minibuffer-history))
  :custom
    (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
	
  :config 
    (counsel-mode 1))

(use-package amx
  :config
  (amx-mode 1))

(use-package ivy-prescient
  :after 
    counsel
  :custom 
    (ivy-prescient-enable-filtering t)
  :config
    (prescient-persist-mode 1)
    (setq ivy-prescient-mode t))

(use-package helpful
  :commands 
    (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
    (counsel-describe-function-function #'helpful-callable)
    (counsel-describe-variable-function #'helpful-variable)
  :bind
    ([remap describe-function] . counsel-describe-function)
    ([remap describe-command] . helpful-command)
    ([remap describe-variable] . counsel-describe-variable)
    ([remap describe-key] . helpful-key))

(use-package ivy-rich
  :after ivy
  :config (ivy-rich-mode t))

(use-package fuzzy)

(use-package ivy-fuz)

(use-package all-the-icons-ivy-rich)

(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
(setq ivy-rich-path-style 'abbrev)
(setq ivy-rich-display-transformers-list
  '(ivy-switch-buffer (
    :columns
       ((ivy-rich-switch-buffer-icon (:width 2))
        (ivy-rich-candidate (:width 30))
        (ivy-rich-switch-buffer-size (:width 8))
        (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
        (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))
        (ivy-rich-switch-buffer-project (:width 15 :face success))
        (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path 
        (ivy-rich-minibuffer-width 0.3))))))
    :predicate
        (lambda (cand) (get-buffer cand)))))

(use-package counsel-projectile
    :after projectile
    :config  (counsel-projectile-mode))

;; ============================================================
(use-package visual-fill-column
  :config
    (setq visual-fill-column-center-text t)
    (setq visual-fill-column-enable-sensible-window-split t)
    (setq visual-fill-column-width 105))

;; ============================================================
(use-package auctex) 
(use-package auctex-latexmk)
;; ============================================================
;; org

(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


(defun will/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(( "^ *\\([-]\\) "
                              (0 (prog1 () (compose-region
                                            (match-beginning 1)
                                            (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil 
                        :font "Cantarell" 
                        :weight 'regular 
                        :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground 'unspecified :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))

(defun will/org-mode-setup ()
    (org-indent-mode 1)
    (variable-pitch-mode 1)
    (visual-line-mode 1))

(defun will/org-mode-visual-fill ()
  (setq visual-fill-column-width 105)
  (setq visual-fill-column-center-text t) ; mb not
  (visual-fill-column-mode 1))

(defun insert-attr-decls ()
  (interactive)
  (insert "#+ATTR_ORG: :width 600 :align center\n"))

(use-package org
  :pin org
  :commands (org-capture org-agenda)
  :hook
  ((org-mode . will/org-mode-setup)
   (org-mode . will/org-mode-visual-fill)
   (org-mode . will/org-font-setup))
  ;; :hook (#'valign-mode)
  :defer 2
  :bind (("C-c n w" . insert-attr-decls)
         ("C-c l"  . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c j" . org-roam-dailies-goto-today))


  :config 
  (setq org-ellipsis " ▾")
  (setq org-startup-with-inline-images t)
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-agenda-files '("~/Documents/org-mode/tasks.org"
                           "~/Documents/org-mode/habits.org"))
  (setq org-agenda-span 10)
  (setq org-agenda-loop-over-headlines-in-active-region nil)
  (setq org-agenda-tags-column -30)
  (setq org-agenda-window-setup 'current-window)

  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60)

  (setq org-todo-keywords '((sequence "TODO(t)" "DONE(d!)")))

  (setq org-refile-targets
        '(("~/Documents/org-mode/tasks.org" :maxlevel . 1)
          ("~/Documents/org-mode/habits.org" :maxlevel . 1)))

  ;; Save Org buffers after refiling!
  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (setq org-capture-templates
        '(("t" "TODO" entry
           (file+headline "~/Documents/org-mode/Tasks.org" "Tasks") "* TODO %? %i %a")))

  (setq org-format-latex-options
        '(:foreground default
                      :background default
                      :scale 1.8
                      :html-foreground "Black"
                      :html-background "Transparent"
                      :html-scale 1.0
                      :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))



  (setq org-latex-default-packages-alist
        '(("AUTO" "inputenc" t ("pdflatex"))
          ("T1" "fontenc" t ("pdflatex"))
          ("" "graphicx" t nil)
          ("" "grffile" t nil)
          ("" "longtable" nil nil)
          ("" "rotating" nil nil)
          ("normalem" "ulem" t nil)
          ("" "amsmath" t nil)
          ("" "textcomp" t nil)
          ("" "amssymb" t nil)
          ("" "hyperref" t nil)))

  (setq org-image-actual-width '(600)))

(setq calendar-latitude 42.36)
(setq calendar-longitude -71.057)
(setq calendar-location-name "Boston, MA")

(use-package org-bullets
    :hook (org-mode . org-bullets-mode)
    :custom
        (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package org-tree-slide)

(with-eval-after-load 'org
    (org-babel-do-load-languages
    'org-babel-load-languages '((emacs-lisp . t)
                                (python . t)
                                (sql . t)
                                (octave .t)
                                (sqlite . t)
                                (matlab . t)
                                (latex . t)
                                (C . t)
                                (makefile . t)
                                (R . t)
                                (shell . t)
                                (spice . t)))
    (push '("conf-unix" . conf-unix) org-src-lang-modes)
    (setq org-confirm-babel-evaluate nil))

;;make tabs act sanely in code blocks
(setq org-src-tab-acts-natively t)
;; (setq org-src-preserve-indentation t)

(with-eval-after-load 'org
    (require 'org-tempo)
    (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
    (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
    (add-to-list 'org-structure-template-alist '("py" . "src python"))
    (add-to-list 'org-structure-template-alist '("cpp" . "src C++"))
    (add-to-list 'org-structure-template-alist '("oct" . "src octave"))
    (add-to-list 'org-structure-template-alist '("sp" . "src spice"))
    (add-to-list 'org-structure-template-alist '("R" . "src R")))

(use-package org-drill)

;;org download allows images to be yanked from the web and from the clipboard
(use-package org-download
    :after org
    :bind
        (:map org-mode-map(
            ("s-Y" . org-download-screenshot)
            ("s-y" . org-download-clipboard)))
    :config
        (setq org-download-screenshot-method "spectacle -br -o %s")
        (setq org-download-annotate-function (lambda (_link) ""))
        (setq org-download-image-attr-list nil))

(add-hook 'emacs-startup-hook '(lambda () (setq org-roam-db-autosync-mode t)))

(use-package org-roam
  :hook (org-mode . will/org-mode-setup)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n t" . org-roam-tag-add)
         ("C-c n a" . org-roam-alias-add)
         ("C-c n r" . org-roam-node-random))
  :config
  (require 'org-roam-protocol)
  (setq org-refile-allow-creating-parent-nodes 'confirm)
  (setq org-roam-buffer-postrender-functions '(org-latex-preview))
  (setq org-roam-completion-everywhere t)
  (setq org-roam-db-autosync-mode t)
  (setq org-roam-db-update-on-save t)
  (setq org-roam-directory "/home/will/Documents/org-mode/zettel/")

  (setq org-roam-node-display-template
        (concat "${title:*} "
                (propertize "${tags:40}" 'face 'org-tag)))

  (setq org-roam-mode-section-functions
        (list #'org-roam-backlinks-section
              #'org-roam-reflinks-section
              #'org-roam-unlinked-references-section))

  (setq org-roam-capture-templates
        '(("d" "default" plain "%?" :target
           (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                      "#+title: ${title}\n#+STARTUP: = latexpreview")
           :unnarrowed t)))

  (setq org-ellipsis " ▾")

  (add-to-list 'display-buffer-alist
               '("\\*org-roam\\*"
                 (display-buffer-in-direction)
                 (direction . right)
                 (window-width . 0.40)
                 (window-height . fit-window-to-buffer)))

  ;; roam dailies config
  (setq org-roam-dailies-directory "daily/")
  (setq org-roam-dailies-capture-templates
        '(("d" "default" entry
           "* %?"
           :target (file+head "%<%Y-%m-%d>.org"
                              "#+title: %<%Y-%m-%d>\n")))))

(use-package websocket
	:after org)

(use-package org-roam-ui
	:after org
;;         normally we'd recommend hooking orui after org-roam, but
;;         since org-roam does not have a hookable mode anymore,
;;         you're advised to pick something yourself if you don't care
;;         about startup time, use
    :defer 4
    :config
        (setq org-roam-ui-sync-theme t)
        (setq org-roam-ui-follow t)
        (setq org-roam-ui-update-on-save t)
        (setq org-roam-ui-open-on-start t)
    :custom
        (setq org-roam-ui-mode t))


;; ============================================================
(use-package yafolding
  :ensure t
  :hook
  ((c++-mode . yafolding-mode)
   (cc-mode . yafolding-mode)
   (python-mode . yafolding-mode)
   (prog-mode . yafolding-mode)))

(use-package ws-butler
  :hook ((c-mode-common-hook . ws-butler-mode)
         (python-mode-hook . ws-butler-mode)))


(use-package flyspell
  :custom (setq flyspell-issue-message-flag nil
				ispell-local-dictionary "en_US"
				ispell-program-name "aspell"
				ispell-extra-args '("--sug-mode=ultra")))

(use-package flyspell-correct)

(use-package ac-ispell)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode 0)
  :hook ((c++-mode . flycheck-mode)
         (elisp-mode . flycheck-mode)
         (python-mode . flycheck-mode)
         (octave-mode . flycheck-mode)
         (typescript-mode . flycheck-mode))
  :custom (setq flycheck-check-syntax-automatically '(save mode-enable)))

;; tags for code navigation
(use-package ggtags
    :ensure t
    :bind
        (:map ggtags-mode-map
        ("C-c g s" . ggtags-find-other-symbol)
        ("C-c g h" . ggtags-view-tag-history)
        ("C-c g r" . ggtags-find-reference)
        ("C-c g f" . ggtags-find-file)
        ("C-c g c" . ggtags-create-tags)
        ("C-c g u" . ggtags-update-tags)
        ("M-," . pop-tag-mark))
    :custom
        (setq-local imenu-create-index-function #'ggtags-build-imenu-index))

(use-package yasnippet
  :ensure t
  :hook
  (c++-mode . yas-global-mode)
  (cc-mode . yas-global-mode)
  (python-mode . yas-global-mode))

;; ============================================================
;; misc languages
(defun will/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . will/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l") ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :hook 
    (lsp-mode . lsp-ui-mode)
  :custom
    (lsp-ui-doc-position 'bottom))

(use-package lsp-ivy
  :after lsp)

(use-package lsp-treemacs
  :after lsp)

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(use-package python-mode
  :ensure t
  :hook ((python-mode-hook . lsp-deferred)
         (python-mode-hook . whitespace-mode))
  :custom (python-shell-interpreter "python3"))

(use-package pyvenv
  :after python-mode
  :config (pyvenv-mode t))

(use-package ob-spice)
(use-package spice-mode)
(setq spice-simulator "ngspice")
;;(setq spice-waveform-viewer "ngplot")

(add-to-list 'auto-mode-alist '("\\.cir$" . spice-mode))
(add-to-list 'auto-mode-alist '("\\.ckt$" . spice-mode))
(add-to-list 'auto-mode-alist '("\\.inp$" . spice-mode))
(add-to-list 'auto-mode-alist '("\\.spout$" . spice-mode));hspice out
(add-to-list 'auto-mode-alist '("\\.pdir$" . spice-mode))
;;; Intel formats
(add-to-list 'auto-mode-alist '("\\.[sS][pP]$" . spice-mode))
(add-to-list 'auto-mode-alist '("\\.[sm]?t0$" . spice-mode))
(add-to-list 'auto-mode-alist '("\\.[h]?spice$" . spice-mode))


(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)))

(add-hook 'inferior-octave-mode-hook
          (lambda ()
            (turn-on-font-lock)
            (define-key inferior-octave-mode-map [up]
              'comint-previous-input)
            (define-key inferior-octave-mode-map [down]
              'comint-next-input)))

;; ============================================================
;; c-lang conf
(add-hook 'c-mode-common-hook (lambda ()
	(when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
	(ggtags-mode 1))))
(add-hook 'c++-mode-hook (lambda () (setq whitespace-mode nil)
                                    (setq whitespace-mode t)))

(add-to-list 'auto-mode-alist '("\\.ino\\'" . c-mode))
(add-hook 'c-mode-common-hook (lambda () (setq whitespace-mode t)))
(setq c-backspace-function 'backward-delete-char)
(setq c-basic-offset 4)
(setq c-cleanup-list nil)
(setq c-default-style '((awk-mode . "awk") (other . "gnu")))
(setq c-electric-pound-behavior '(alignleft))
(setq c-ignore-auto-fill '(string c c++ cpp code))
(setq c-label-minimum-indentation 4)
(add-hook 'c-mode-common-hook 'yafolding-mode)
(setq c-objc-method-arg-min-delta-to-bracket 0)
(setq c-objc-method-arg-unfinished-offset 0)
(setq c-objc-method-parameter-offset 0)
(setq c-offsets-alist '((substatement-label . 0) (label . 0)))
(setq c-syntactic-indentation nil)
(setq c-syntactic-indentation-in-macros nil)
(setq c-tab-always-indent t)

(add-to-list 'auto-mode-alist '("\\.qml\\'" . c++-mode))

(global-set-key (kbd "<f5>") (lambda () (interactive)
                               (setq-local compilation-read-command nil)
                               (cppcm-reload-all)
                               (call-interactively 'compile)))

(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t
 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t)

(use-package irony
:hook
    (c++-mode-hook . irony-mode)
    (c-mode-hook . irony-mode)
    (objc-mode-hook . irony-mode))

;; OPTIONAL, avoid typing full path when starting gdb
(use-package cpputils-cmake)
(global-set-key (kbd "C-c C-g C-d") (lambda () (interactive)
    (gud-gdb (concat "gdb --fullname " (cppcm-get-exe-path-current-buffer)))))

(use-package cmake-project
  :hook
    (c-mode-hook . maybe-cmake-project-mode)
    (c++-mode-hook . maybe-cmake-project-mode)
  :custom
    (defun maybe-cmake-project-mode ()
      (if (or (file-exists-p "CMakeLists.txt")
          (file-exists-p 
             (expand-file-name "CMakeLists.txt" 
                (car (project-roots (project-current))))))
      (cmake-project-mode))))

(use-package cmake-mode)

(use-package cmake-font-lock) 

(use-package cmake-ide)

(use-package cpp-auto-include)

(use-package company
    :hook
        (c-common-mode-hook . company-mode)
        (c++-mode-hook . company-mode)
        (python-mode-hook . company-mode)
        (lisp-mode-hook . company-mode)
    :custom
        (setq company-minimum-prefix-length 1)
        (setq company-idle-delay 0.2)
        (setq company-show-numbers t)
        (setq company-tooltip-limit 20)
        (setq company-dabbrev-downcase nil)
    :bind
        (:map company-active-map ("<tab>" . company-select-next))
        ("C-;" . company-complete-selection)
    :config
        (add-to-list 'company-backends 'company-c-headers 'company-irony 'company-gtags))

(use-package company-irony :ensure t :defer t)

(use-package company-box :hook (company-mode . company-box-mode))

(use-package projectile
    :diminish projectile-mode
    :config (projectile-mode)
    :custom ((projectile-completion-system 'ivy))
    :bind-keymap
        ("C-c p" . projectile-command-map)
    :init
    ; NOTE: Set this to the folder where you keep your Git repos!
        (when (file-directory-p "~/Documents/code")
        (setq projectile-project-search-path '("~/Documents/code")))
        (setq projectile-switch-project-action #'projectile-dired))

(use-package company-c-headers :defer t)
;; ============================================================
(use-package with-editor)

(use-package magit
    :ensure t
    :after with-editor
    :hook (magit-mode . magit-wip-mode)
    :bind ("C-x g" . magit-status))

(use-package forge
  :after magit)

;; ============================================================
(use-package semantic
    :config
        (global-semanticdb-minor-mode 1)
        (global-semantic-idle-scheduler-mode 1)
    (semantic-mode 1))
;; ============================================================
(use-package pdf-tools) 
(use-package valign)
(use-package mpv)

(use-package djvu)
(use-package math-symbol-lists)



(load "/home/will/.emacs.d/conf/ibuffer-conf.el")
(load "/home/will/.emacs.d/conf/shell-conf.el")
(load "/home/will/.emacs.d/conf/dired-conf.el")
(load "/home/will/.emacs.d/conf/elfeed-conf.el")
(load "/home/will/.emacs.d/conf/mu4e-conf.el")
(load "/home/will/.emacs.d/conf/erc-conf.el")
(load "/home/will/.emacs.d/conf/lisp-conf.el")

