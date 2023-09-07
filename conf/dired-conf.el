(use-package all-the-icons
  :if (display-graphic-p)
  :custom  (when (display-graphic-p)))


(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(defun dired-duplicate-this-file ()
  "Duplicate file on this line."
  (interactive)
  (let* ((this  (dired-get-filename t))
         (ctr   1)
         (new   (format "%s[%d]" this ctr)))
    (while (file-exists-p new)
      (setq ctr  (1+ ctr)
            new  (format "%s[%d]" this ctr)))
     (dired-copy-file this new nil))
  (revert-buffer))

(use-package dired-subtree
  :after dired
  :ensure t
  :bind (:map dired-mode-map
			  ("i" . dired-subtree-insert)
			  ("r" . dired-subtree-remove)))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump)
    :map dired-mode-map
        ;; ("r" . dired-kill-subdir)
		("w" . browse-url-of-dired-file)
		("W" . dired-copy-filename-as-kill)
        ("y" . dired-duplicate-this-file))
  :config
        (setq dired-dwim-target t)
        (setq dired-recursive-copies 'always)
        (setq dired-listing-switches "-ghFGDa --group-directories-first"))

(use-package dired-single
  :commands (dired dired-jump))

;; (use-package dired-open
  ;; :commands (dired dired-jump)
  ;; :config
  ;; (setq dired-open-extensions '(("mpg" . "mpv --no-border")
  ;;                               ("mpeg" . "mpv --no-border")
  ;;                               ("mp4" . "mpv --no-border")
  ;;                               ("avi" . "mpv --no-border")
  ;;                               ("wmv" . "mpv --no-border")
  ;;                               ("mov" . "mpv --no-border")
  ;;                               ("flv" . "mpv --no-border")
  ;;                               ("ogg" . "mpv --no-border")
  ;;                               ("mkv" . "mpv --no-border")
  ;;                               ("gif" . "mpv --no-border")
  ;;                               ("png" . "feh")
  ;;                               ("jpg" . "feh")
  ;;                               ("jpeg" . "feh")
  ;;                               ("webm" . "feh")
  ;;                               ("bmp" . "feh")
  ;;                               ("doc" . "libreoffice")
  ;;                               ("xls" . "libreoffice")
  ;;                               ("ppt" . "libreoffice")
  ;;                               ("odt" . "libreoffice")
  ;;                               ("ods" . "libreoffice")
  ;;                               ("odg" . "libreoffice")
  ;;                               ("odp" . "libreoffice")
  ;;                               ("pdf" . "zathura")
  ;;                               ("ps" . "zathura")
  ;;                               ("ps.gz" . "zathura")
  ;;                               ("epub" . "zathura")
  ;;                               ("dvi" . "zathura"))))

(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :bind (:map dired-mode-map ("." . dired-hide-dotfiles-mode)))
