
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
