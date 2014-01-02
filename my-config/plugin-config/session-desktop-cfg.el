;;设置Session
;;========================================================
(require 'session)
(add-hook 'after-init-hook session-initialize)
;;设置desktop
;;========================================================
(load "desktop")
(setq desktop-path '("~/.emacs.d/temp/"))
(setq desktop-dirname "~/.emacs.d/temp/")
(setq desktop-base-file-name "e-desktop")
(setq desktop-save t)
;;设置自动保存
(desktop-save-mode t)

