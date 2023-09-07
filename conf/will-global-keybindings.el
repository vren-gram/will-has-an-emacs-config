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
