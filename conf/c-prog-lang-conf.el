


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
