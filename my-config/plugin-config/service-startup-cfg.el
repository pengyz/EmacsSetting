;;emacs server启动
;;========================================
(require 'server)
(setq server-dir (concat temp-path "/server"))
;; 存储位置设置在init.el中的customize中，在此处设置，server会失效。
(setq server-use-tcp t)

(if (not (file-exists-p server-dir))
	(make-directory server-dir))
(when (and (= emacs-major-version 24)
           (= emacs-minor-version 3)
           (equal window-system 'w32))
  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
                                                 ; ~/.emacs.d/server is unsafe"
                                                 ; on windows.
(server-start)
