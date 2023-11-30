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
