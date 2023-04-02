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
  (setq visual-fill-column-center-text t)
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
