
(use-package all-the-icons-ibuffer)

(use-package ibuffer
  :bind ("C-x C-b" . ibuffer)
  :hook ((ibuffer-auto-mode . ibuffer-mode)
         (ibuffer-switch-to-saved-filter-groups . ibuffer-mode))
  :config
  (setq ibuffer-saved-filter-groups
        (quote (("home"
                 ("emacs-config" (or
                                  (filename . ".emacs.d")
                                  (filename . "emacs.org")
                                  (filename . "init.el")))
                 ("dired" (mode . dired-mode))
                 ("c++" (mode . c++-mode))
                 ("erc" (mode . erc-mode))
                 ("emacs" (or
                           (name . "^\\*scratch\\*$")
                           (name . "^\\*Messages\\*$")))
                 ("mu4e" (mode . mu4e-headers-mode))
                 ("journal" (directory . "/home/will/Documents/org-mode/zettel/daily/"))
                 ("agenda" (or
                            (name . "^\\*Org Agenda\\*$")
                            (filename . "Tasks.org")
                            (filename . "Habits.org")))
                 ("org" (mode . org-mode))
                 ("magit" (or
                           (name . "\*magit")
                           (mode . "Magit Process")))))))
  
  (setq ibuffer-expert t)
  (setq ibuffer-show-empty-filter-groups nil))

