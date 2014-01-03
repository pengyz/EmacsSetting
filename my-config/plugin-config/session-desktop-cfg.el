;;设置Session
;;========================================================
(require 'session)
(add-hook 'after-init-hook session-initialize)
;;设置desktop
;;========================================================
;; (load "desktop")
(require 'desktop)
(setq desktop-dir (concat temp-path "/desktop"))
(check-temp-dir desktop-dir)
(setq desktop-path (list desktop-dir))
(setq desktop-dirname desktop-dir)
(setq desktop-base-file-name "e-desktop")
(setq desktop-save t)
;;设置自动保存
(desktop-save-mode t)

