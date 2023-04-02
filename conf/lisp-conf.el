
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
(slime-setup '(slime-fancy slime-quicklisp slime-asdf))

(use-package smartparens
    :hook ((lisp-mode) (emacs-lisp-mode)))

(use-package paredit
    :hook ((lisp-mode . paredit-mode) (emacs-lisp-mode . paredit-mode) (lisp-data-mode . paredit-mode)))

(require 'smartparens-config)

(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

