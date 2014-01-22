;;全屏函数
(defun linux-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_ULLSCREEN" 0))
  )
;; 最大化-linux
(defun linux-maximize-frame ()
  "linux maximize the current frame"
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  )
;;根据系统类型最大化
(defun my-maximize-frame ()
  "Maximize the current frame for linxu and windows"
  (interactive)
  (if (eq system-type 'windows-nt)
      (run-with-idle-timer 0.1 nil 'w32-send-sys-command 61488)
    ;; (linux-maximize-frame)
    )
  )
