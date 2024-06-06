(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(cpputils-cmake yasnippet-snippets doom-modeline command-log-mode rainbow-delimiters clean-aindent-mode slime ac-ispell ac-octave adaptive-wrap all-the-icons-dired all-the-icons-ibuffer all-the-icons-ivy auctex auctex-latexmk auto-complete bash-completion bundler c++-mode c-mode cmake-font-lock cmake-mode cmake-project company company-box company-c-headers company-irony company-irony-c-headers counsel-pydoc counsel-tramp cpp-auto-include dashboard dired-hide-dotfiles dired-icon dired-open dired-single dired-subtree djvu eldoc-cmake elfeed elfeed-goodies elpy eshell-git-prompt ess eterm-256color flycheck flycheck-google-cpplint flyspell-correct-ivy forge fuzzy ggtags inf-ruby irony irony-eldoc ivy-fuz js2-mode julia-formatter julia-mode lisp-mode lsp-ivy lsp-julia lsp-mode lsp-treemacs lsp-ui magit math-symbol-lists minesweeper mpv mu4e mu4e-alert nginx-mode nodejs-repl openwith org-download org-drill org-gcal org-roam org-roam-ui org-tree-slide paredit pdf-tools pomm pydoc python-info python-mode pyvenv rust-mode skewer-mode smartparens sudoku typescript-mode valign vertico vterm websocket with-editor ws-butler yafolding yasnippet)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-minibuffer-match-face-1 ((t (:foreground "#c792ea" :weight light))))
 '(line-number ((t (:foreground "#676E95" :strike-through nil :underline nil :slant normal :weight normal :height 1.0 :width normal :family "Hack"))))
 '(line-number-current-line ((t (:foreground "#676E95" :strike-through nil :underline nil :slant normal :weight normal :height 1.0 :width normal :family "Hack"))))
 '(mu4e-compose-header-face ((t (:inherit message-separator :foreground "white" :slant italic))))
 '(mu4e-ok-face ((t (:inherit font-lock-comment-face :foreground "medium spring green" :slant normal :weight bold))))
 '(org-agenda-clocking ((t (:background "medium sea green" :foreground "blanched almond"))))
 '(org-agenda-done ((t (:inherit org-done :foreground "DarkSeaGreen4"))))
 '(org-scheduled ((t (:foreground "pale green"))))
 '(org-scheduled-previously ((t (:foreground "OrangeRed1"))))
 '(org-scheduled-today ((t (:foreground "lemon chiffon"))))
 '(org-table ((t (:inherit fixed-pitch :background "black" :foreground "snow" :slant normal :weight regular :height 120 :width normal :foundry "SRC" :family "Hack"))))
 '(org-upcoming-deadline ((t (:foreground "PaleGreen1"))))
 '(swiper-background-match-face-1 ((t (:inherit swiper-match-face-1))))
 '(swiper-match-face-1 ((t (:background "#c792ea" :foreground "black"))))
 '(trailing-whitespace ((t (:background "dim gray"))))
 '(whitespace-big-indent ((t (:background "black" :foreground "firebrick")))))

;; ============================================================
;; startup-vars
(setq gc-cons-threshold (floor (* 100 1000 1000)))
;; ============================================================
;; visual things
(setq visible-cursor nil)
(setq blink-cursor-mode nil)
(setq standard-indent 2)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
(setq indicate-buffer-boundaries nil)
(setq word-wrap t)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(toggle-frame-maximized)
(global-visual-line-mode t)
;; ============================================================
;;disp line numbers
(setq display-line-numbers-widen t
      display-line-numbers-grow-only t
      display-line-numbers-width 2
      display-line-numbers-width-start 2)
(global-display-line-numbers-mode t)
;; ============================================================
;; Default UI
(setq inhibit-startup-message t
      inhibit-startup-screen t
      inhibit-startup-buffer-menu t)
(tool-bar-mode -1)                 ; Disable the toolbar
(tooltip-mode -1)                  ; Disable tooltips
(menu-bar-mode -1)                 ; Disable the menu bar
(put 'downcase-region 'disabled nil)
;;============================================================
;; initial buffer things
(setq initial-buffer-choice t
      ;; TODO remove?
      ;; initial-major-mode 'org-mode
      initial-scratch-message ""
      frame-resize-pixelwise t)
;; ============================================================
;; misc
(setq column-number-mode t)
(setq confirm-kill-processes nil)
(setq large-file-warning-threshold nil)
(setq linum-format 'dynamic)
(setq case-replace t)
(setq resize-mini-windows t)
(setq byte-compile-warnings '(cl-functions))
;; ============================================================
;; global auto revert to help with syncthing and magit
(global-auto-revert-mode t)
;; switch to help windows when invoked
(setq help-window-select t)
;; makes all yes prompts into y prompts
(defalias 'yes-or-no-p 'y-or-n-p)
;; ============================================================
;; backups
(setq backup-by-copying t               ; don't clobber symlinks
      backup-directory-alist
      '(("." . "~/.emacs.d/.saves"))    ; don't litter my fs tree
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)       ; use versioned backups
;; ============================================================
;; global-keybindings
(define-key global-map (kbd "C-x C-n") 'next-buffer)
(define-key global-map (kbd "C-x C-p") 'previous-buffer)
(define-key global-map (kbd "M-]") 'next-buffer)
(define-key global-map (kbd "M-[") 'previous-buffer)

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

(global-set-key (kbd "C-j") 'newline)

(defun go-to-init ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f8>") 'go-to-init)

;; ============================================================
;; whitelisted command
(put 'dired-find-alternate-file 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)
;; ============================================================
;;scroll-vars
;; TODO delete?
(setq scroll-conservatively 1000)
;; (setq scroll-down-aggressively 0.01)
;; (setq scroll-margin 2)
;; (setq scroll-preserve-screen-position nil)
;; (setq scroll-step 1)
;; (setq scroll-up-aggressively 0.01)
(setq next-screen-context-lines 2)
(setq overline-margin 20)
;; ============================================================
;; font-config
;; TODO: make fonts system flexible?
;; (cond
;;  ((eq system-type 'gnu/linux)
;;   (when (member "DejaVu Sans Mono" (font-family-list))
;;     (set-frame-font "DejaVu Sans Mono" t t)))
;;  ((eq system-type 'windows-nt)
;;   (when (member "Courier New" (font-family-list))
;;     (set-frame-font "Courier New" t t)))
;;  ((eq system-type 'darwin) ; macOS
;;   (when (member "Menlo" (font-family-list))
;;     (set-frame-font "Menlo" t t))))

(defvar will/default-font-size 120)
(defvar will/default-variable-font-size 150)

(set-face-attribute 'default nil
                    :font "Hack"
                    :height will/default-font-size)

(set-face-attribute 'fixed-pitch nil
                    :font "Courier New"
                    ;; :font "SF Mono"
                    :height will/default-font-size)

(set-face-attribute 'variable-pitch nil
                    :font "Consolas"
                    ;; :font "Noto Sans"
                    :height will/default-variable-font-size
                    :weight 'light)
;; ============================================================
;; custom functions
;; TODO rework this?
(defun toggle-window-split ()
  (interactive)
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
  (auto-package-update-interval 30)     ; 30 days
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-at-time "10:00")
  (auto-package-update-maybe))
;; ============================================================
(use-package no-littering)

;; mb broken tag
(use-package server
  :init
  (add-hook 'after-init-hook
            (lambda () (unless (or noninteractive (server-running-p))
                    (server-start)))))
;; ============================================================
(use-package doom-themes
  :init (load-theme 'doom-palenight t)
  ;; todo why was this here?
  ;; :after all-the-icons
)

(use-package doom-modeline
  :ensure t
  :config (setq doom-modeline-height 15)
  :custom (doom-modeline-mode t))
;; ============================================================
(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode 1)
  (setq which-key-idle-delay 1))
;; ============================================================
;; ivy

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-'" . ivy-immediate-done)
         ("C-k" . ivy-kill-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (setq ivy--regex-function 'ivy--regex-plus)
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
   ("C-c C-f" . counsel-ag) ;; TODO this gets shadowed somewhere?
   ("M-x" . counsel-M-x)
   :map minibuffer-local-map
   ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))

(use-package ivy-rich
  :after ivy
  :config (setq ivy-rich-path-style 'abbrev)
  :custom (ivy-rich-mode t))

;; line reccomended by package author
(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)

(use-package all-the-icons-ivy-rich
  :config
  (all-the-icons-ivy-rich-mode t))

(use-package ivy-prescient
  :after counsel
  :custom
  (setq ivy-prescient-enable-filtering t)
  (setq ivy-prescient-retain-classic-highlighting t)
  :config
  (prescient-persist-mode 1)
  (ivy-prescient-mode 1))

(add-to-list 'completion-styles 'prescient)

;; (defvar ivy-rich--ivy-switch-buffer-cache
;;   (make-hash-table :test 'equal))

;; (define-advice ivy-rich--ivy-switch-buffer-transformer
;;     (:around (old-fn x) cache)
;;   (let ((ret (gethash x ivy-rich--ivy-switch-buffer-cache)))
;;     (unless ret
;;       (setq ret (funcall old-fn x))
;;       (puthash x ret ivy-rich--ivy-switch-buffer-cache))
;;     ret))

;; (define-advice +ivy/switch-buffer
;;     (:before (&rest _) ivy-rich-reset-cache)
;;   (clrhash ivy-rich--ivy-switch-buffer-cache))

(setq ivy-rich-display-transformers-list
      '(ivy-switch-buffer
        (:columns
         ((ivy-rich-modify-column
           'ivy-switch-buffer
           'ivy-rich-switch-buffer-major-mode
           '(:width 20 :face error))
          (ivy-rich-switch-buffer-icon (:width 2))
          (ivy-rich-candidate (:width 15))
          (ivy-rich-switch-buffer-size (:width 8))
          (ivy-rich-switch-buffer-indicators
           (:width 4 :face error :align right))
          (ivy-rich-switch-buffer-major-mode
           (:width 20 :face warning))
          (ivy-rich-switch-buffer-project
           (:width 15 :face success))
          (ivy-rich-switch-buffer-path
           (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path
                           (ivy-rich-minibuffer-width 0.3))))))
         :predicate
         (lambda (cand)
           (get-buffer cand)))))
;; ============================================================
(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump)
         :map dired-mode-map
         ;; ("r" . dired-kill-subdir)
		 ("w" . dired-open-file)
		 ("W" . dired-copy-filename-as-kill))
  :config (setq dired-dwim-target t)
  :custom ((dired-listing-switches "-agho --group-directories-first")))

(use-package dired-single
  :commands (dired dired-jump))

(use-package all-the-icons
  :if (display-graphic-p)
  :custom  (when (display-graphic-p)))

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-subtree
             :bind (:map dired-mode-map
                         ("r" . dired-subtree-remove)
                         ("i" . dired-subtree-insert)))

(use-package dired-open
  :commands (dired dired-jump)
  :config
  (setq dired-open-extensions '(("mpg" . "mpv --no-border")
                                ("mpeg" . "mpv --no-border")
                                ("mp4" . "mpv --no-border")
                                ("avi" . "mpv --no-border")
                                ("wmv" . "mpv --no-border")
                                ("mov" . "mpv --no-border")
                                ("flv" . "mpv --no-border")
                                ("ogg" . "mpv --no-border")
                                ("mkv" . "mpv --no-border")
                                ("gif" . "mpv --no-border")
                                ("png" . "geeqie")
                                ("jpg" . "geeqie")
                                ("jpeg" . "geeqie")
                                ("webm" . "geeqie")
                                ("bmp" . "geeqie")
                                ("doc" . "libreoffice")
                                ("xls" . "libreoffice")
                                ("ppt" . "libreoffice")
                                ("odt" . "libreoffice")
                                ("ods" . "libreoffice")
                                ("odg" . "libreoffice")
                                ("odp" . "libreoffice")
                                ("pdf" . "zathura")
                                ("ps" . "zathura")
                                ("ps.gz" . "zathura")
                                ("epub" . "zathura")
                                ("dvi" . "zathura"))))

(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :bind (:map dired-mode-map ("." . dired-hide-dotfiles-mode)))
;; ============================================================
(use-package helpful
  :bind
  ((:map helpful-mode-map
         ("q" . kill-this-buffer)))
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
;; ============================================================
(use-package visual-fill-column
  :config
  (setq visual-fill-column-center-text t)
  (setq visual-fill-column-enable-sensible-window-split t)
  (setq visual-fill-column-width 105))
;; ============================================================
(use-package tex
             :ensure auctex)
(use-package auctex-latexmk
             :ensure t)
(setq TeX-view-program-selection '(((output-dvi has-no-display-manager)
                                    "dvi2tty")
                                   ((output-dvi style-pstricks)
                                    "dvips and gv")
                                   (output-dvi "xdvi")
                                   (output-pdf "Zathura")
                                   (output-html "xdg-open")))
;; ============================================================
(use-package term
  :commands term
  :config
  (setq explicit-shell-file-name "bash")
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))

(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))

(use-package vterm
  :commands vterm
  :config
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")
  (setq vterm-max-scrollback 10000))

(when (eq system-type 'windows-nt)
  (setq explicit-shell-file-name "powershell.exe")
  (setq explicit-powershell.exe-args '()))

(defun configure-eshell ()
  ;; Save command history when commands are entered
  (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)

  ;; Truncate buffer for performance
  (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

  (setq eshell-history-size         10000
        eshell-buffer-maximum-lines 10000
        eshell-hist-ignoredups t
        eshell-scroll-to-bottom-on-input t))

(use-package eshell-git-prompt
  :after eshell)

(use-package eshell
  :hook (eshell-first-time-mode . configure-eshell)
  :config

  (with-eval-after-load 'esh-opt
    (setq eshell-destroy-buffer-when-process-dies t)
    (setq eshell-visual-commands '("htop" "zsh" "vim")))

  (eshell-git-prompt-use-theme 'powerline))
;; ============================================================
(use-package all-the-icons-ibuffer)

(use-package ibuffer
  :bind (("C-x C-b" . ibuffer)
		 ("C-\\" . ibuffer)
		 :map ibuffer-mode-map
		 ("C-\\" . quit-window)
		 ("C-x C-b" . quit-window))
  :hook ((ibuffer-mode . ibuffer-auto-mode)
         (ibuffer-mode . (lambda () (ibuffer-switch-to-saved-filter-groups "home"))))
  :config
  (setq ibuffer-saved-filter-groups
        (quote (("home"
                 ("emacs-config" (or
                                  (filename . ".emacs.d")
                                  (filename . "emacs.org")
                                  (filename . "init.el")
                                  (filename . ".emacs.d/conf/")))
                 ("c++" (mode . c++-mode))
				 ("python" (or (mode . python-mode)
							   (mode . inferior-python-mode)))
                 ("erc" (mode . erc-mode))
				 ("common-lisp" (or (mode . lisp-mode)
									(mode . slime-repl-mode)
									(name . "^\\slime-events\\*$")
									(name . "^\\*inferior-lisp*\\*$")))
                 ("emacs" (or
                           (name . "^\\*scratch\\*$")
                           (name . "^\\*Messages\\*$")))
                 ("mu4e" (or (mode . mu4e-headers-mode)
							 (name . "^\\*mu4e-main*\\*$")))
                 ("journal" (directory . "/home/will/Documents/org-mode/zettel/daily/"))
                 ("agenda" (or
                            (name . "^\\*Org Agenda\\*$")
							(name . "^\\*Calendar*\\*$")
                            (filename . "tasks.org")
                            (filename . "habits.org")
                            (filename . "archive.org")
                            (filename . "scratch.org")
                            (filename . "recurring.org")))
                 ("org" (mode . org-mode))
                 ("magit" (or
                           (name . "\*magit")
                           (mode . "Magit Process")))
                 ("dired" (mode . dired-mode))
				 ("help" (mode . helpful-mode))
				 ("TeX"
				  (or
				   (derived-mode . tex-mode)
				   (mode . latex-mode)
				   (mode . context-mode)
				   (mode . ams-tex-mode)
				   (mode . bibtex-mode)))))))

  (setq ibuffer-formats '((mark modified read-only locked " " (name 30 30 :left)
                                " " filename-and-process) (mark " " (name 16 -1) " " filename)))

  (setq ibuffer-expert t)
  (setq ibuffer-show-empty-filter-groups nil))
;; ============================================================
;; org
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
                        :font "Microsoft Sans Serif"
                        ;; :font "Cantarell"
                        :weight 'regular
                        :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground 'unspecified :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :font "Hack" :height will/default-font-size)
  (set-face-attribute 'org-table nil :font "Hack" :height will/default-font-size)
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))

(defun will/org-mode-setup ()
    (org-indent-mode 1)
    (variable-pitch-mode 1)
    (display-line-numbers-mode 0)
    (visual-line-mode 1))

(defun will/org-mode-visual-fill ()
  (setq visual-fill-column-width 105)
  (setq visual-fill-column-center-text t)
  (visual-fill-column-mode t))

(defun insert-attr-decls ()
  (interactive)
  (insert "#+attr_html: :width 400 :align center")
  (dotimes (n 2) (org-toggle-inline-images)))

(use-package org
  :pin org
  :commands (org-capture org-agenda)
  :hook ((org-mode . will/org-mode-setup)
         (org-mode . will/org-mode-visual-fill)
         (org-mode . will/org-font-setup))
  :defer 2
  :bind (("C-c n w" . insert-attr-decls)
         ("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c j" . org-roam-dailies-goto-today)
         ("C-c C-x C-a" . org-toggle-archive-tag)
         ("C-c a" . org-agenda)
         ("C-c C-x C-j" . org-clock-goto))

  :defer 2
  :config
  (global-set-key (kbd "C-c a") 'org-agenda)
  (setq org-ellipsis " ▾")
  (setq org-startup-with-inline-images t)
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-src-preserve-indentation t)
  (setq org-agenda-clockreport-parameter-plist '(:link t :maxlevel 2 :block lastmonth :step day))

  (setq org-agenda-start-day "-2d")
  (setq org-agenda-span 10)
  (setq org-agenda-loop-over-headlines-in-active-region nil)
  (setq org-agenda-tags-column -30)
  (setq org-agenda-window-setup 'current-window)

  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60)

  (setq org-todo-keywords '((sequence "TODO(t)" "JUGGLING(j)" "BLOCKED(b)" "|" "DONE(d!)" "CANCELLED(c!)")))

  (setq org-priority-highest 1
        org-priority-default 3
        org-priority-lowest  7)

  (setq org-clocktable-defaults '(:maxlevel 3
                                            :lang "en"
                                            :scope agenda-with-archives
                                            :block nil
                                            :wstart 1
                                            :mstart 1
                                            :narrow 40!
                                            :indent t
                                            :formatter nil))

  (setq org-highest-priority 1)
  (setq org-default-priority 3)
  (setq org-lowest-priority 7)

  (cond
   ((eq system-type 'windows-nt)
    (setq org-agenda-files '("~/org-mode/tasks.org"
                             "~/org-mode/habits.org"
                             "~/org-mode/zettel/scratch.org"
                             "~/org-mode/archive.org")))
   ((eq system-type 'gnu/linux)
    (setq org-agenda-files '("~/documents/org-mode/zettel/tasks.org"
                             "~/documents/org-mode/zettel/habits.org"
                             "~/documents/org-mode/zettel/archive.org"
                             "~/documents/org-mode/zettel/recurring.org"))))

  (cond
   ((eq system-type 'windows-nt)
    '(("~/org-mode/tasks.org" :maxlevel . 1)
      ("~/org-mode/archive.org" :maxlevel . 1)
      ("~/org-mode/habits.org" :maxlevel . 1)))
   ((eq system-type 'gnu/linux)
    (setq org-refile-targets
          '(("~/documents/org-mode/zettel/tasks.org" :maxlevel . 2)
            ("~/documents/org-mode/zettel/archive.org" :maxlevel . 2)
            ("~/documents/org-mode/zettel/habits.org" :maxlevel . 2)))
    ;; Save Org buffers after refiling!
    (advice-add 'org-refile :after 'org-save-all-org-buffers)))

  (cond
   ((eq system-type 'windows-nt)
    (setq org-capture-templates
        '(("t" "TODO" entry
           (file+headline "~/org-mode/tasks.org" "Tasks") "* TODO %? %i %a"))))
   ((eq system-type 'gnu/linux)
    (setq org-capture-templates
          '(("t" "TODO" entry
             (file "~/documents/org-mode/zettel/tasks.org") "* TODO %? %i %a"))))))

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

(setq org-image-actual-width '(400))

(setq calendar-latitude 42.36)
(setq calendar-longitude -71.057)
(setq calendar-location-name "Providence, RI")

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-todo-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook #'org-summary-todo)

(use-package org-bullets
             :hook (org-mode . org-bullets-mode)
             :custom
             (org-bullets-bullet-list '("◉" "⦾" "●" "○" "●" "○" "●")))

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

;;org download allows images to be yanked from the web and from the clipboard
(defun will/org-download-clipboard-and-name ()
  (interactive)
  (org-download-screenshot (concat (read-string "filename? ") ".png")))

(use-package org-download
             :after org
             :bind (:map org-mode-map(
                                      ("s-Y" . org-download-screenshot)
                                      ("s-y" . will/org-download-clipboard-and-name)))
             :config
             (setq org-download-screenshot-method "spectacle -br -o %s")
             (setq org-download-annotate-function (lambda (_link) ""))
             (setq org-download-image-attr-list nil)
             (add-hook 'dired-mode-hook 'org-download-enable)
             (setq org-download-image-html-width 400)
             (setq org-download-timestamp ""))


(use-package org-roam
  :hook (org-mode . will/org-mode-setup)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n t" . org-roam-tag-add)
         ("C-c n a" . org-roam-alias-add)
         ("C-c n r" . org-roam-node-random))
  :config (require 'org-roam-protocol)
  (setq org-refile-allow-creating-parent-nodes 'confirm)
  (setq org-roam-buffer-postrender-functions '(org-latex-preview))
  (setq org-roam-completion-everywhere t)
  (setq org-roam-db-autosync-mode t)
  (setq org-roam-db-update-on-save t)
  (cond
   ((eq system-type 'windows-nt )
    (setq org-roam-directory "~/org-mode/zettel/"))
   ((eq system-type 'gnu/linux)
    (setq org-roam-directory "/home/will/documents/org-mode/zettel/")))


  (setq org-roam-node-display-template
        (concat "${title:*} "
                (propertize "${tags:10}" 'face 'org-tag)))

  (setq org-roam-mode-section-functions
        (list #'org-roam-backlinks-section
              #'org-roam-reflinks-section))

  (setq org-roam-capture-templates
        '(("d" "default" plain "%?" :target
           (file+head "${slug}.org"
                      "#+title: ${title}\n#+STARTUP: = latexpreview showall")
           :unnarrowed t)))

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
    :defer 4
    :config
        (setq org-roam-ui-sync-theme t)
        (setq org-roam-ui-follow t)
        (setq org-roam-ui-update-on-save t)
        (setq org-roam-ui-open-on-start t)
    :custom
        (setq org-roam-ui-mode t))
;; ============================================================
(use-package flyspell
  :custom (setq flyspell-issue-message-flag nil
                ispell-local-dictionary "en_US"
                ispell-program-name "aspell"
                ispell-extra-args '("--sug-mode=ultra")))

(use-package flyspell-correct)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode 0)
  ;; TODO delete?
  ;; :hook ((c++-mode . flycheck-mode)
  ;;        (elisp-mode . flycheck-mode)
  ;;        (octave-mode . flycheck-mode)
  ;;        (typescript-mode . flycheck-mode))
  :config
         (setq flycheck-check-syntax-automatically '(save)))
;; ============================================================
;; TODO put with prog mode
;; tags for code navigation
(use-package eglot
  :ensure t
  :defer t
  :bind (:map eglot-mode-map
              ;; ("C-c C-d" . eldoc)
              ("C-c C-e" . eglot-rename)
              ;; ("C-c C-f" . eglot-format-buffer)
              ("C-c C-o" . python-sort-imports))
  :hook ((python-mode . eglot-ensure)
         (c++-mode . eglot-ensure)
         (typescript-mode . eglot-ensure)
         (python-mode . (lambda () (set-fill-column 80))))
  :config
  (add-to-list 'eglot-stay-out-of 'flymake 'flycheck)
  (setq-default eglot-workspace-configuration
                `((:pylsp .
                          (:plugins
                           (:jedi_completion (:include_params t :fuzzy t)
                                             :pydocstyle (:enabled nil)
                                             :pycodestyle (:enabled nil)
                                             :mccabe (:enabled nil)
                                             :pyflakes (:enabled nil)
                                             :autopep8 (:enabled :json-false)
                                             :black (:enabled t)))))))




(use-package typescript-mode
  :mode "\\.ts\\'"
  :config
  (setq typescript-indent-level 2))

;; todo fix python config
(use-package python
  :ensure t
  :bind (:map python-mode-map
              ("C-c C-d" . pydoc-at-point)
              ("C-c C-p" . run-python)
              :map inferior-python-mode-map
              ("C-c C-d" . pydoc-at-point)
              ("C-c C-p" . run-python)
              ("C-c C-z" . other-window))
  :hook
  (python-mode . eglot-ensure)
  (python-mode . whitespace-mode)
  (python-mode . yas-global-mode)
  (python-mode . company-mode)
  (inferior-python-mode . company-mode)
  (inferior-python-mode . python-shell-completion-native-turn-off)
  :config
  (setq python-indent-offset 4)
  (cond ((eq system-type 'windows-nt)
         (setq python-shell-interpreter "ipython"))
        ((eq system-type 'gnu/linux)
         (setq python-shell-interpreter "python3"))))

(use-package pyvenv
  :after python-mode
  :config (pyvenv-mode t))

(use-package ob-spice)
(use-package spice-mode)
(setq spice-simulator "ngspice")
;;(setq spice-waveform-viewer "ngplot")

;; auto mode finds the mode to activate for a file
;; based on its ending
(dolist (amlist '(("\\.cir$" . spice-mode)
                  ("\\.ckt$" . spice-mode)
                  ("\\.inp$" . spice-mode)
                  ("\\.spout$" . spice-mode)
                  ("\\.pdir$" . spice-mode)
                  ("\\.[sS][pP]$" . spice-mode)
                  ("\\.[sm]?t0$" . spice-mode)
                  ("\\.[h]?spice$" . spice-mode)
                  ("\\.ino\\'" . c-mode)
                  ("\\.qml\\'" . c++-mode)
                  ("\\.m$" . octave-mode)))
  (add-to-list 'auto-mode-alist amlist))

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

(setq inferior-octave-program "/usr/bin/octave")

(use-package yasnippet
  :defer 0
  :hook ((prog-mode . yas-minor-mode))
  :bind (:map prog-mode-map
              (("C-c C-<tab>" . yas-expand))))

;; todo do I really want to be using company?
(use-package company
  :hook ((c-common-mode . company-mode)
         (c++-mode . company-mode)
         (python-mode . company-mode)
         (emacs-lisp-mode . company-mode)
         (bash-mode-hook . company-mode))
  :config
  (setq company-minimum-prefix-length 3)
  (setq company-idle-delay 2)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 20)
  (setq company-dabbrev-downcase nil)
  :bind (:map company-active-map
              (("C-n" . company-select-next)
               ("C-p" . company-select-previous) )
              ;; ("C-;" . company-complete-selection)
              :map company-mode-map (("C-'" . company-complete-selection)
                                     ("C-<tab>" . company-complete)))
  :config (add-to-list 'company-backends
                       'company-c-headers
                       'company-irony
                       'company-gtags))
;; ============================================================
(use-package magit
  :ensure t
  :after with-editor
  :hook (magit-mode . magit-wip-mode)
  :bind ("C-x g" . magit-status))

(use-package forge
             :after magit)

(use-package with-editor
             :after magit)
;; ============================================================
;; todo what is semantic doing for me?
(use-package semantic
  :config
  (global-semanticdb-minor-mode 1)
  (global-semantic-idle-scheduler-mode 1)
  (semantic-mode 1))
;; ============================================================
(use-package ggtags
  :ensure t
  :hook '((c-mode . ggtags-mode)
          (c++-mode . ggtags-mode)
          (java-mode . ggtags-mode)
          (asm-mode . ggtags-mode))
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

(dolist (mode '(term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; todo remove?
;; (use-package counsel-projectile
;;   :after projectile
;;   :config  (counsel-projectile-mode t))

(use-package clean-aindent-mode
  :hook prog-mode)

(use-package rainbow-delimiters
  :hook prog-mode)

(use-package yafolding
  :ensure t
  :hook (prog-mode . yafolding-mode))

(use-package ws-butler
  :hook (prog-mode . ws-butler-mode))

(use-package command-log-mode
             :commands command-log-mode)

(use-package counsel-pydoc
             :after
             counsel)
;; ============================================================
;; TODO cleanup
(require 'slime)

(load (expand-file-name "~/.quicklisp/slime-helper.el"))

(setq inferior-lisp-program "sbcl --dynamic-space-size 8192")

(use-package smartparens
    :hook ((lisp-mode . smartparens-mode)
		   (emacs-lisp-mode . smartparens-mode)))

(use-package paredit
  :bind (:map paredit-mode-map
			  ("C-r" . paredit-open-parenthesis)
			  ("C-M-f" . paredit-forward-slurp-sexp)
			  ("C-M-b" . paredit-forward-barf-sexp))
  :hook ((lisp-mode . paredit-mode)
		 (emacs-lisp-mode . paredit-mode)
		 (lisp-data-mode . paredit-mode)))

(require 'smartparens-config)

(defun will/pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  ;; 955= λ
  (setq prettify-symbols-alist
        '(("lambda" . 955))))

(add-hook 'lisp-mode-hook 'will/pretty-lambda)
(add-hook 'lisp-mode-hook 'prettify-symbols-mode)
;; (add-hook 'lisp-mode-hook 'auto-complete-mode)
(add-hook 'lisp-mode-hook 'slime-autodoc-mode)
(add-hook 'lisp-mode-hook #'(lambda () (indent-tabs-mode -1)))
(define-key lisp-mode-map [(tab)] 'slime-fuzzy-indent-and-complete-symbol)
(define-key lisp-mode-map (kbd "M-z") 'slime)

(add-hook 'emacs-lisp-mode-hook 'will/pretty-lambda)
(add-hook 'emacs-lisp-mode-hook 'prettify-symbols-mode)
(add-hook 'emacs-lisp-mode-hook #'(lambda () (indent-tabs-mode -1)))

(use-package slime
  :bind ((:map slime-repl-mode-map
	       ("TAB" . slime-fuzzy-indent-and-complete-symbol)
	       ("C-c C-z" . other-window))
	 (:map slime-fuzzy-completions-map
	       ("C-d" . slime-describe-symbol)

	       ("q" . kill-this-buffer)))
  :hook ((slime-repl-mode . (lambda () (paredit-mode +1)))
	 (slime-repl-mode . (lambda () (rainbow-delimiters-mode +1)))
	 (slime-repl-mode . (lambda () (auto-complete-mode '1)))
	 (slime-repl-mode . slime-autodoc-mode))
  :config
  (setq slime-description-autofocus t)
  (setq lisp-indent-function 'lisp-indent-function)
  (setq common-lisp-style-default "sbcl"))

(defun slime-fuzzy-window-configuration-change ()
  nil)

(slime-setup '(slime-fancy slime-quicklisp slime-asdf))
;; ============================================================
;; eldoc
;; TODO put with PROG mode
(setq eldoc-echo-area-use-multiline-p 2)
(setq eldoc-echo-area-display-truncation-message nil)

;; ============================================================
;; indent and tabs
;; TODO put with PROG mode
(setq indent-tabs-mode nil)
(setq electric-indent-mode t)
(setq backward-delete-char-untabify-method 'hungry)

(load "/home/will/.emacs.d/conf/elfeed-conf.el")
(load "/home/will/.emacs.d/conf/mu4e-conf.el")
(load "/home/will/.emacs.d/conf/erc-conf.el")
