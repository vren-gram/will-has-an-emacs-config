
(setq indent-tabs-mode nil)
(setq electric-indent-mode nil)
(setq backward-delete-char-untabify-method 'hungry)

;;Create a variable for our preferred tab width
(setq custom-tab-width 4)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;;Making electric-indent behave sanely
(setq-default electric-indent-inhibit t)

;; Visualize tabs as a pipe character - "|"
;;This will also show trailing characters as they are useful to spot.
(setq whitespace-style '(face tabs tab-mark trailing))
(setq whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9]))) ;;124 is the ascii ID for '\|'
