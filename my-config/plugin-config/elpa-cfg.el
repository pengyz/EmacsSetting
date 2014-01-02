
;;check the plugin-path dir and use it for elpa


;;add hook to install elpa packages
;; (add-hook 'before-init-hook (lambda ()
;; 							  (progn
;; 								(jpk-add-source)
;; 								(jpk-package-list-install))))
(global-set-key (kbd "C-z p") 'package-list-unaccounted-packages)

