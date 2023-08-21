(require 'slime)

;; (load (expand-file-name "~/.quicklisp/slime-helper.el"))

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
(add-hook 'lisp-mode-hook '(lambda () (indent-tabs-mode -1)))
(define-key lisp-mode-map [(tab)] 'slime-fuzzy-indent-and-complete-symbol)
(define-key lisp-mode-map (kbd "M-z") 'slime)

(add-hook 'emacs-lisp-mode-hook 'will/pretty-lambda)
(add-hook 'emacs-lisp-mode-hook 'prettify-symbols-mode)
(add-hook 'emacs-lisp-mode-hook '(lambda () (indent-tabs-mode -1)))

;; (use-package slime
;; 			 :bind ((:map slime-repl-mode-map
;; 						  ("TAB" . slime-fuzzy-indent-and-complete-symbol)
;; 						  ("C-c C-z" . other-window))
;; 					(:map slime-fuzzy-completions-map
;; 						  ("C-d" . slime-describe-symbol)
;; 						  ("q" . quit-window)))
;; 			 :hook ((slime-repl-mode . (lambda () (paredit-mode +1)))
;; 					(slime-repl-mode . (lambda () (rainbow-delimiters-mode +1)))
;; 					;; (slime-repl-mode . (lambda () (auto-complete-mode '1)))
;; 					(slime-repl-mode . slime-autodoc-mode))
;; 			 :config
;; 			 (setq slime-description-autofocus t)
;; 			 (setq lisp-indent-function 'common-lisp-indent-function)
;; 			 (setq common-lisp-style-default "sbcl"))

;; (slime-setup '(slime-fancy slime-quicklisp slime-asdf))
