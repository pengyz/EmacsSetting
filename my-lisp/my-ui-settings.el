;;;;UI-Settings start here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;隐藏工具栏
(tool-bar-mode -1)
;;隐藏菜单栏;
(menu-bar-mode -1)
;;隐藏滚动条
(scroll-bar-mode -1)
;;允许外部粘
(setq x-select-enable-clipboard t)
;;启用鼠标
(xterm-mouse-mode t)
(mouse-wheel-mode t)
;;开启图片浏览
(auto-image-file-mode)
;;禁用启动信息
(setq inhibit-startup-message t)
;;显示行号
(global-linum-mode 'linum-mode)
;;以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p) 
;;开启语法高亮
(global-font-lock-mode 1)
;;设置tab为4个空格的宽度
(setq default-tab-width 4)
(setq c-basic-offset 4)
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
;;	 (linux-maximize-frame)
	 )
)
;;启动emacs时窗口最大化
(my-maximize-frame)
;;设置Emacs显示标题（bufferName@yourName-Emacs24.2）
(setq frame-title-format "%b@Pengyz-Emacs24.2")
;;个人信息设置
(setq user-full-name "Pengyz")
(setq user-mail-address "pengyz@tunynet.com")
;;鼠标自动避开光标
(mouse-avoidance-mode 'animate) 
;;取消光标闪烁
;;(blink-cursor-mode -1)
;;高亮显示要拷贝的内容
(transient-mark-mode 1)
;;开启括号匹配
(show-paren-mode 1)

;;;;UI-Settings end   here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;Time-Settings start here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;启用时间显示设置
(display-time-mode 1)
;;时间使用24小时制
(setq display-time-24hr-format t)
;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
;;时间的变化频率
(setq display-time-interval 10)


;;;;Time-Settings end   here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
