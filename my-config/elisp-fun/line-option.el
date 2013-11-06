;; line-option.el============================================================

;; 自己平时也看一些关于elisp的东西，写一些小的函数，方便自己使用emacs。
;; 这是第一批，主要是结合recent-mark，写了几个dwin的函数，方便行操作

;; TODO:目前还有一个小bug，就是rm-kill-ring-save在我写的函数中调用不成功，原因不明，挺奇怪。
;; DONE:已解决，可以复制成功，只不过需要手动调用一次rm-deactive-mark。

;; TODO：在刚刚开启emacs，还没有做激活任何标记的时候，调用3个函数进行行操作，均报错。
;; DONE：interactive中不能使用 “r” 参数，这样在没有激活区域的时候会报错。使用了2个C函数获取region的
;;       起始和结束点。同时使用 “*”参数对行剪切和删除做了限制。 

;; line-option.el============================================================






;; ====my-dwin-kill-region====================
;; ========剪切操作==========
;; 区域选中：剪切区域
;; 矩形区域选中：剪切矩形区域
;; 未选中：剪切当前行
;; ===========================================
(defun my-dwin-kill-region ()
  "dwin cut option between region and line"
  (interactive "*")
  (if (and rm-mark-active)				; 矩形操作
  	  (rm-kill-region (region-beginning) (region-end))
  	(if (and mark-active)				; 区域操作
  		(kill-region (region-beginning) (region-end))
	  (my-line-option 'cut))))			; 剪切当前行

;; ====my-dwin-kill-ring-save=================
;; ========复制操作==========
;; 区域选中：复制区域
;; 矩形区域选中：复制矩形区域
;; 未选中：复制当前行
;; ===========================================
(defun my-dwin-kill-ring-save ()
  "dwin copy option between region and line"
  (interactive)
  (if (and rm-mark-active)				; 矩形操作
  	  (progn (rm-kill-ring-save (region-beginning) (region-end))
			 (rm-deactivate-mark))
  	(if (and mark-active)				; 区域操作
		(kill-ring-save (region-beginning) (region-end))
	  (my-line-option 'cpy))))			; 复制当前航

;; ====my-dwin-delete-region==================
;; ========删除操作==========
;; 区域选中：删除区域
;; 矩形区域选中：删除矩形区域
;; 未选中：删除当前行
;; ===========================================
(defun my-dwin-delete-region ()
  "dwin delete option between region and line"
  (interactive "*")
  (if (and rm-mark-active)				; 矩形操作
  	  (delete-rectangle (region-beginning) (region-end))
  	(if (and mark-active)				; 区域操作
  		(backward-delete-char (- (region-end) (region-beginning)))
	  (my-line-option 'del))))			; 删除当前行

;; ====my-line-option==================
;; ========行操作==========
;; cpy-复制
;; del-删除
;; cut-剪切
;; ====my-line-option==================
(defun my-line-option (option)
  "cut,copy,delete option with the current line"
  (interactive)
  (let ((origional nil)					; 定义origional,beg,end局部变量
		(beg nil)
		(end nil))
	(setq origional (point))
	  (beginning-of-line)
	  (setq beg (point))
	  (end-of-line)
	  (setq end (point))
	  (if (eq 'cpy option)				; option=cpy 复制当前行，恢复光标位置并给出提示信息
		  (progn (kill-ring-save beg end)		
				 (goto-char origional)
				 (message "copyed the whole line"))
	  (if (eq 'cut option)				; option=cut 剪切当行
		  (kill-region beg end)
		(if (eq 'del option)			; option=del 删除当前行
			(backward-delete-char (- end beg))
		  (error "Wrong argument!"))))))
