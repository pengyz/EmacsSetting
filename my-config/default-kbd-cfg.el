;;;;KeyBinding-Setting start here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;临时记号
(global-set-key (kbd "C-z t") 'ska-point-to-register)
(global-set-key (kbd "C-z g") 'ska-jump-to-register)
;;查找字符
(global-set-key (kbd "C-z f") 'wy-go-to-char)
;; %进行括号匹配
(global-set-key "%" 'match-paren)
;; home到文档开始
(global-set-key (kbd "<home>") 'beginning-of-buffer)
;; end到文档结尾
(global-set-key (kbd "<end>") 'end-of-buffer)
;; ;;C-z h隐藏emacs窗口
;; (global-set-key (kbd "C-z z") 'suspend-frame)
;;替换M ;上的注释
(global-set-key (kbd "M-;") 'my-comment-dwim-line) 
;;各窗口间切换
(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<down>") 'windmove-down)
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
(global-set-key (kbd "<f3>") (lambda ()
                             (interactive)
                             (kill-buffer)
                             (delete-window))) 
;;Ctrl-F3 : 关闭当buffer
(global-set-key (kbd "C-<f3>") 'kill-this-buffer)
;;Alt-F3 : 关闭当前buffer
(global-set-key (kbd "M-<f3>") 'delete-window)
;;F4 speedbar
(global-set-key (kbd "<f4>") 'speedbar)
;;F5 : 当前buffer打开shell
(global-set-key (kbd "<f5>") 'shell)
;;C-F5 : 在新窗口打开shell
(global-set-key (kbd "C-<f5>") (lambda()
						   (interactive)
						   (split-window-below)
						   (other-window-for-scrolling)
						   (shell)
						   ))
;;F6 : org-publish
(global-set-key (kbd "<f6>") 'org-publish)
;;F17：添加当前页到书签中
(global-set-key (kbd "<f7>") 'bookmark-set)
;;C-F7：列举我的书签
(global-set-key (kbd "C-<f7>") 'list-bookmarks)


;;;;KeyBinding-Setting end   here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
