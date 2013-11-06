;;tabbarSettings
;;========================================================
(defun my-tabbar-settings ()
  "my tabbar setting fun"
  (add-to-list 'load-path (concat plugin-path "/tabbar"))
  (require 'tabbar)
  (tabbar-mode)
  (require 'my-tabbar-settings)
  ;; kbd settings
  (global-set-key (kbd "C-z C-f") 'tabbar-forward-group)
  (global-set-key (kbd "C-z C-b") 'tabbar-backward-group)
  (global-set-key (kbd "C-z C-p") 'tabbar-forward-tab)
  (global-set-key (kbd "C-z C-n") 'tabbar-backward-tab))

;; active tabbar if used in windows or xwindow
(if (or (eq window-system 'x) 
		(eq window-system 'w32))
	(my-tabbar-settings))
