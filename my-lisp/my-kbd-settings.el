;;;;KeyBinding-Setting start here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;使用C-x C-m调用M-x
(global-set-key "\C-x\C-m" 'smex)
(global-set-key "\C-c\C-m" 'smex)
;;C-k 删除一行
(global-set-key "\C-k" 'kill-whole-line)
;;C-w向后删除一个词
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
;;ibuffer Ctrl-x Ctrl-b
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;Ctrl-z 撤销
(global-set-key (kbd "C-z") 'undo)
;;C-c m设置标记
(global-set-key "\C-cm" 'set-mark-command)
;;F1 : 打开ecb
(global-set-key [(f1)] 'ecb-activate)
;;Ctrl-F1 : 隐藏ecb
(global-set-key [(control f1)] 'ecb-deactivate)
;;F2 : 切换当前块折叠状态
(global-set-key [(f2)] 'hs-toggle-hiding)
;;Ctrl-F2 :全部折叠
(global-set-key [(control f2)] 'hs-hide-all)
;;Alt-F2 : 全部显示
(global-set-key [(M-f2)] 'hs-show-all)
;;F3 : 关闭当前buffer
(global-set-key[(f3)] 'kill-this-buffer)
;;Ctrl-F3 : 关闭当前窗口
(global-set-key [(C-f3)] 'delete-window)
;;Alt-F3 : 关闭当前buffer与当前窗口
(global-set-key [(M-f3)] (lambda ()
                             (interactive)
                             (kill-buffer)
                             (delete-window))) 

;;F4 : 重置ecb窗口
(global-set-key [(f4)] 'ecb-restore-default-window-sizes)
;;F6 speedbar
(global-set-key [(f6)] 'speedbar)
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
;;F11 : 最大化
;;(global-set-key [(f11)] 'w32-)



;;;;KeyBinding-Setting end   here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



