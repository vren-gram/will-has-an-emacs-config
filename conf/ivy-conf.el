
(use-package ivy
  ;; :diminish
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
     (setq ivy-mode t))

;; necessary for ivy to work
(use-package swiper 
  :after ivy
  :ensure t)

(use-package counsel
  :bind 
    (("C-x b" . 'counsel-switch-buffer)
     :map minibuffer-local-map
       ("C-r" . 'counsel-minibuffer-history))
  :custom
    (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config 
    (setq counsel-mode t))

(use-package ivy-prescient
  :after 
    counsel
  :custom 
    (ivy-prescient-enable-filtering nil)
  :config
    ;(prescient-persist-mode 1)
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
