;;file header settings
;;========================================================
(require 'header2)
;;(require 'header)
(setq make-header-hooks '(header-mode-line
						  header-blank
						  header-file-name
						  header-blank
						  header-copyright
						  header-blank
						  header-author
						  header-creation-date
						  header-modification-author
						  header-modification-date
						  header-update-count
						  header-blank
						  header-history
						  header-blank
						  ))
(setq header-copyright-notice "GPL Liciences" )
(make-local-variable 'user-full-name)
(make-local-variable 'user-mail-address)

;;kbd
;;========================================================
(global-set-key (kbd "C-z h") 'make-header)
(global-set-key (kbd "C-z u") 'update-file-header)
