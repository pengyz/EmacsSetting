;;;;KeyBinding-Setting start here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;替换M ;上的注释
(global-set-key (kbd "M-;") 'my-comment-dwim-line) 
;;各窗口间切换
(global-set-key [C-left] 'windmove-left)
(global-set-key [C-right] 'windmove-right)
(global-set-key [C-up] 'windmove-up)
(global-set-key [C-down] 'windmove-down)
;;C-w向后删除一个词
(global-set-key (kbd "C-w") 'backward-kill-word)
;; C-x C-k 剪切
(global-set-key (kbd "C-x C-k") 'kill-region)
;; C-c C-k 复制
(global-set-key (kbd "C-c C-k") 'kill-ring-save)
;;Ctrl-x Ctrl-b ibuffer 
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;Ctrl-z 撤销
(global-set-key (kbd "C-z") 'undo)
;;C-c m设置标记
(global-set-key (kbd "C-c m") 'set-mark-command)
;;F3 : 关闭当前buffer
(global-set-key[(f3)] 'kill-this-buffer)
;;Ctrl-F3 : 关闭当前窗口
(global-set-key [(C-f3)] 'delete-window)
;;Alt-F3 : 关闭当前buffer与当前窗口
(global-set-key [(M-f3)] (lambda ()
                             (interactive)
                             (kill-buffer)
                             (delete-window))) 


;;F4 speedbar
(global-set-key [(f4)] 'speedbar)
;;F8 : 当前buffer打开shell
(global-set-key[(f8)] 'shell)
;;C-F8 : 在新窗口打开shell
(global-set-key [(C-f8)] (lambda()
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



