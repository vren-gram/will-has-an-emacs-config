;; fonts
(defvar will/default-font-size 120)
(defvar will/default-variable-font-size 150)

(set-face-attribute 'default nil 
                    :font "Hack"  
                    :height will/default-font-size)

(set-face-attribute 'fixed-pitch nil 
                    :font "SF Mono" 
                    :height will/default-font-size)

(set-face-attribute 'variable-pitch nil 
                    :font "Noto Sans" 
                    :height will/default-variable-font-size 
                    :weight 'light)
