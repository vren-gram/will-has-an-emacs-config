
;;prevents open with from being weird about email attachments
(add-to-list  'mm-inhibit-file-name-handlers 'openwith-file-handler)
(setq mml-secure-openpgp-signers '("8926CB43E72497F80A1D7C6B6F918584FDCFEB9D"))

(use-package mu4e
  :ensure nil
  :bind
  (("C-c u" . mu4e-update-mail-and-index)
   ("C-c m" . mu4e))
  :config
  ;; This is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)
  (setq mu4e-view-fields '(:from
                           :to 
                           :cc 
                           :subject
                           :flags
                           :date
                           :maildir
                           :mailing-list
                           :tags
                           :attachments
                           :signature
                           :decryption))

  (add-hook 'mu4e-compose-mode-hook 'mml-secure-message-sign-pgpmime)

  (setq mu4e-view-show-images t)
  (setq mu4e-compose-format-flowed t)
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-maildir "~/Maildir/")

  ;; prevent duplicate unread messages count
  (setq mu4e-headers-skip-duplicates nil)
  (setq mu4e-headers-include-related nil)


  (setq message-kill-buffer-on-exit t)
  ;; Don't ask for a 'context' upon opening mu4e
  (setq mu4e-context-policy nil)
  ;; Don't ask to quit... why is this the default?
  (setq mu4e-confirm-quit nil)
  (setq mu4e-maildir-shortcuts '(("/gmail/INBOX" . ?i)
                                 ("/gmail/Sent Mail" . ?s)
                                 ("/gmail/Trash" . ?t)
                                 ("/gmail/Drafts" . ?d)
                                 ("/gmail/All Mail" . ?a)))
  (setq mail-user-agent 'mu4e-user-agent)
  (setq mu4e-split-view 'split-vertically)
  (setq mu4e-completing-read-function #'ivy-completing-read)
  (setq mu4e-view-show-addresses 't)
  (setq mu4e-contexts
        (list (make-mu4e-context
               :name "william.emerson.tower@gmail.com"
               :match-func
               (lambda (msg)
                 (when msg
                   (string-prefix-p "/gmail" (mu4e-message-field msg :maildir))))
               :vars '((user-mail-address . "william.emerson.tower@gmail.com")
                       (user-full-name    . "Will Tower")
                       (smtpmail-smtp-server  . "smtp.gmail.com")
                       (mu4e-compose-signature . "Sine Cera, Will")
                       (smtpmail-smtp-service . 465)
                       (smtpmail-stream-type  . ssl)
                       (mu4e-inbox-folder . "/gmail/INBOX")
                       (mu4e-drafts-folder  . "/gmail/Drafts")
                       (mu4e-sent-folder  . "/gmail/Sent Mail")
                       (mu4e-refile-folder  . "/gmail/All Mail")
                       (mu4e-trash-folder  . "/gmail/Trash"))))))

(setq user-mail-address "william.emerson.tower@gmail.com")


(use-package smtpmail
  :custom
  (smtpmail-smtp-server "smtp.gmail.com")
  (smtpmail-smtp-service 465)
  (smtpmail-smtp-user "william.emerson.tower")
  (smtpmail-stream-type 'ssl)
  (message-send-mail-function 'smtpmail-send-it)
  (smtpmail-smtp-server "smtp.fastmail.com"))

(setq will/mu4e-inbox-query
	  "(maildir:/gmail/INBOX AND flag:unread")

(use-package mu4e-alert
  :after mu4e
  :config
  ;; Show unread emails from all inboxes
  (setq mu4e-alert-interesting-mail-query will/mu4e-inbox-query)
  ;; Show notifications for mails already notified
  (setq mu4e-alert-notify-repeated-mails nil)
  (mu4e-alert-enable-notifications))
