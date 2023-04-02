

(defun toggle-window-split () (interactive)
    (if (= (count-windows) 2)
    (let* ((this-win-buffer (window-buffer))
        (next-win-buffer (window-buffer (next-window)))
        (this-win-edges (window-edges (selected-window)))
        (next-win-edges (window-edges (next-window)))
        (this-win-2nd (not (and (<= (car this-win-edges)
        (car next-win-edges))
        (<= (cadr this-win-edges)
        (cadr next-win-edges)))))
        (splitter
        (if (= (car this-win-edges)
            (car (window-edges (next-window))))
            'split-window-horizontally
            'split-window-vertically)))
    (delete-other-windows)
        (let ((first-win (selected-window)))
        (funcall splitter)
        (if this-win-2nd (other-window 1))
        (set-window-buffer (selected-window) this-win-buffer)
        (set-window-buffer (next-window) next-win-buffer)
        (select-window first-win)
    (if this-win-2nd (other-window 1))))))


(defun will/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
    (format "%.2f seconds" 
    (float-time 
     (time-subtract after-init-time before-init-time)))
    gcs-done))

;;display startup time to user
(add-hook 'emacs-startup-hook #'will/display-startup-time)
