
;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

(setq word-wrap t)

;; visual things
(setq visible-cursor nil)
(setq blink-cursor-mode nil)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(setq standard-indent 2)
(setq visible-bell nil)
(setq indicate-buffer-boundaries nil)

;; Default UI
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq inhibit-startup-buffer-menu t)
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(menu-bar-mode -1)            ; Disable the menu bar
;; default transparency settings
(setq default-frame-alist '((alpha 100 . 100)))

;; initial buffer things
(setq initial-buffer-choice "")
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message "")


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


;; backups
(setq
  backup-by-copying t      ; don't clobber symlinks
  backup-directory-alist
  '(("." . "~/.emacs.d/.saves"))    ; don't litter my fs tree
  delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)       ; use versioned backups


