;;设置desktop.el
;;========================================================
(load "desktop")
;;设置desktop的保存路径
(setq desktop-path '("~/.emacs.d/temp"))
(setq desktop-dirname "~/.emacs.d/temp")
(setq desktop-base-file-name "e-desktop")
;;设置自动保存
(desktop-save-mode 1)
;; (desktop-load-default) 
;; (desktop-read) 
