;;UI-Settings ================================================================

;;disable the tool bar
(tool-bar-mode -1)
;; disable menu bar if in termnal
(if (and 
	 (not (eq window-system 'x))
	 (not (eq window-system 'w32)))
	(menu-bar-mode -1))
;;disable scroll bar
(scroll-bar-mode -1)
;;enable clipboard
(setq x-select-enable-clipboard t)
;;use the mouse
(xterm-mouse-mode t)
;;unable wheel yank
(mouse-wheel-mode t);;enable to show image 
;;enable imagefile mode
(auto-image-file-mode)
;;don't show the startup info
(setq inhibit-startup-message t)
;;display line-num
(global-linum-mode 'linum-mode)
;;use y/n instad
(fset 'yes-or-no-p 'y-or-n-p) 
;;open the code color
(global-font-lock-mode 1)
;;set 4 tab width
(setq default-tab-width 4)
(setq c-basic-offset 4)
;;maximize frame when open
(my-maximize-frame)
;;set frame title（bufferName@userName-Emacs24.3）
(setq frame-title-format "%b@pengyz-Emacs24.3")
;;set user info
(setq user-full-name "pengyz")
(setq user-mail-address "orangekbb@gmail.com")
;;mouse avoid the cursor
(mouse-avoidance-mode 'animate) 
;;disable the cursor blink
(blink-cursor-mode -1)
;;high light the copy 
(transient-mark-mode 1)
;;show parent match
(show-paren-mode 1)
;;set the default open dir just for windowsf
(if (eq window-system 'w32)
	(setq default-directory my-windows-default-dir))
;;set the default major mode to org-mode
(setq default-major-mode 'org-mode)
;;enable the time display
(display-time-mode 1)
;;use the 24 hours
(setq display-time-24hr-format t)
;;display the time detail
(setq display-time-day-and-date t)
;;set the fresh time
(setq display-time-interval 10)
