;;列编辑
;;========================================================
(require 'rect-mark)
;;列编辑键绑定
;;========================================================
(global-set-key (kbd "C-z C-x") 'my-dwin-kill-region)
(global-set-key (kbd "C-z C-c") 'my-dwin-kill-ring-save)
(global-set-key (kbd "C-z C-d") 'my-dwin-delete-region)

(global-set-key (kbd "C-z c") 'rm-kill-ring-save)
(global-set-key (kbd "C-z C-y") 'yank-rectangle)
(global-set-key (kbd "C-z i") 'string-insert-rectangle)
(global-set-key (kbd "C-z C-i") 'string-rectangle)
(global-set-key (kbd "C-z m") 'rm-set-mark)

(global-set-key (kbd "C-<down-mouse-1>") 'rm-mouse-drag-region)


