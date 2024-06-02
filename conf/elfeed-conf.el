(use-package elfeed
  :hook (elfeed-show-mode . (lambda () (display-line-numbers-mode 0)))
  :bind (:map elfeed-show-mode-map
              ("r" . image-decrease-size)))

(setf elfeed-show-entry-switch
      (lambda (b)
        (switch-to-buffer b)
        (delete-other-windows)))

(setq elfeed-feeds
      '(("https://astralcodexten.substack.com/feed/" blog rat)
        ("https://dynomight.net/feed.xml" blog rat)
        ("https://www.smbc-comics.com/comic/rss" comic)
        ("https://xkcd.com/atom.xml" comic)
        ("https://www.badspacecomics.com/blog-feed.xml" comic)
        ("https://aella.substack.com/feed/" blog rat)
        ("http://www.gwern.net/rss" blog rat)
        ("https://pbfcomics.com/feed/" comic)
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCl4hLK-YKeHuCAvS8ZPVv5Q" youtube) ;;the mountain goats youtube
        ("https://applieddivinitystudies.com/atom.xml" blog rat)
        ("https://slimemoldtimemold.com/feed/" blog rat)
        ("https://medium.com/feed/@ThingMaker" blog rat) ;; duncan sabien
        ("https://dominiccummings.substack.com/feed/" blog)
        ("https://dominiccummings.substack.com//feed/" blog rat)
        ("https://thingofthings.substack.com/feed/" blog rat) ;;Ozy!
        ("https://edwardsnowden.substack.com/feed/" blog)
        ("https://moreisdifferent.substack.com/feed/" blog rat) ;; Dan! you know, from the meetups
        ("https://www.cold-takes.com/rss/" blog rat)
        ("http://www.lastplanetojakarta.com/index.xml") ;; the mountain goats poetry, no longer updated
        ("https://nothingismere.com/feed/" blog rat) ;;rob bensinger works at miri
        ("https://juliawise.net/feed/" blog rat)
        ("https://www.jefftk.com/news.rss" blog rat) ;;julia's husband
        ("http://zackmdavis.net/blog/feed/" blog rat)
        ("https://codeinsecurity.wordpress.com/feed/" blog) ;; gsuberland
        ("https://accidentalshelfbrowsing.wordpress.com/feed/" blog)
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UC5fdssPqmmGhkhsJi4VcckA" youtube) ;; ian danskin innuendo studios
        ("https://putanumonit.com/feed/" blog rat)
        ("https://terrytao.wordpress.com/feed/" blog math)
        ("https://acesounderglass.com/feed/" blog rat) ;;elizabeth top tier intellectual
        ("https://mapandterritory.org/feed" blog rat)
        ("https://www.scottaaronson.com/blog/?feed=rss2" blog rat)
        ("https://radimentary.wordpress.com/feed/" blog rat)
        ("https://hwfo.substack.com/feed/" blog rat)
        ("https://www.benkuhn.net/rss" blog rat) ;; ben has come to my house
        ("https://eukaryotewritesblog.com/rss/" blog rat Georgia)
        ("https://livingwithinreason.com/feed/" blog rat Wes)
        ("https://hollyelmore.substack.com/feed/" blog rat Holly)))

(use-package elfeed-goodies)
(elfeed-goodies/setup)
'(elfeed-goodies/entry-pane-size 1)
'(elfeed-goodies/feed-source-column-width 20)
'(elfeed-goodies/entry-pane-position 'top)

(add-hook 'elfeed-show-mode-hook
          (lambda () (progn (display-line-numbers-mode 0)
                       (set-face-attribute 'variable-pitch nil
                                           :font "Hack"
                                           :height 120))))
