;;tabbarSettings
;;========================================================
;; (defun my-tabbar-settings ()
;;   "my tabbar setting fun"
;;   (add-to-list 'load-path (concat plugin-path "/tabbar"))
;;   (require 'tabbar)
;;   (tabbar-mode)
;;   (require 'my-tabbar-settings)

;; ;; active tabbar if used in windows or xwindow
;; (if (or (eq window-system 'x) 
;; 		(eq window-system 'w32))
;; 	(my-tabbar-settings))



;;tabbar-ruler
;; (add-to-list 'load-path (concat plugin-path "/tabbar"))
(setq tabbar-ruler-global-tabbar 't) ; If you want tabbar
(setq tabbar-ruler-global-ruler 't) ; if you want a global ruler
;;=====not use==========
(setq tabbar-ruler-popup-menu 'nil) ; If you want a popup menu.
(setq tabbar-ruler-popup-toolbar 'nil) ; If you want a popup toolbar
(setq tabbar-ruler-popup-scrollbar 'nil) ; If you want to only show the
                                        ; scroll bar when your mouse is moving.

(require 'tabbar-ruler)

(global-set-key (kbd "C-z C-t") 'tabbar-ruler-move)

;;kbd settings
;; (global-set-key (kbd "C-z C-f") 'tabbar-forward-group)
;; (global-set-key (kbd "C-z C-b") 'tabbar-backward-group)
;; (global-set-key (kbd "C-z C-p") 'tabbar-forward-tab)
;; (global-set-key (kbd "C-z C-n") 'tabbar-backward-tab)


