;;emacs server启动
;;========================================
(require 'server)
;;这里的 server-auth-dir的值改动以后，emacs无法单实例启动
(check-temp-dir server-auth-dir)
(when (and (= emacs-major-version 24)
           (= emacs-minor-version 3)
           (equal window-system 'w32))
  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
                                                 ; ~/.emacs.d/server is unsafe"
                                                 ; on windows.
(server-start)
