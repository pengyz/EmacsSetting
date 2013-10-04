;;;;KeyBinding-Setting start here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;临时记号
(global-set-key (kbd "C-z t") 'ska-point-to-register)
(global-set-key (kbd "C-z g") 'ska-jump-to-register)
;;查找字符
(global-set-key (kbd "C-z f") 'wy-go-to-char)
;; %进行括号匹配
(global-set-key "%" 'match-paren)
;; C-home到文档开始
(global-set-key (kbd "<home>") 'beginning-of-buffer)
;; C-end到文档结尾
(global-set-key (kbd "<end>") 'end-of-buffer)
;; ;;C-z h隐藏emacs窗口
;; (global-set-key (kbd "C-z z") 'suspend-frame)
;;替换M ;上的注释
(global-set-key (kbd "M-;") 'my-comment-dwim-line) 
;;各窗口间切换
(global-set-key [C-left] 'windmove-left)
(global-set-key [C-right] 'windmove-right)
(global-set-key [C-up] 'windmove-up)
(global-set-key [C-down] 'windmove-down)
;;C-w向后删除一个词
(global-set-key (kbd "C-w") 'backward-kill-word)
;; C-z C-x 剪切
(global-set-key (kbd "C-z C-x") 'kill-region)
;; C-z C-c 复制
(global-set-key (kbd "C-z C-c") 'kill-ring-save)
;;Ctrl-x Ctrl-b ibuffer 
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;Ctrl-z 撤销
(global-set-key (kbd "C-z C-z") 'undo)
;;C-c m设置标记
(global-set-key (kbd "C-c m") 'set-mark-command)
;;F3 : 关闭当前buffer与当前窗口
(global-set-key [(f3)] (lambda ()
                             (interactive)
                             (kill-buffer)
                             (delete-window))) 
;;Ctrl-F3 : 关闭当buffer
(global-set-key [(C-f3)] 'kill-this-buffer)
;;Alt-F3 : 关闭当前buffer
(global-set-key[(M-f3)] 'delete-window)
;;F4 speedbar
(global-set-key [(f4)] 'speedbar)
;;F5 : 当前buffer打开shell
(global-set-key[(f5)] 'shell)
;;C-F5 : 在新窗口打开shell
(global-set-key [(C-f5)] (lambda()
						   (interactive)
						   (split-window-below)
						   (other-window-for-scrolling)
						   (shell)
						   ))
;;F9：列举我的书签
(global-set-key [(f9)] 'list-bookmarks)
;;F10：添加当前页到书签中
(global-set-key [(f10)] 'bookmark-set)

;;;;KeyBinding-Setting end   here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
