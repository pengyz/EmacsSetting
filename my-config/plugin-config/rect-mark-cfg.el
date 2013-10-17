;;列编辑
;;========================================================
(require 'rect-mark)
;;列编辑键绑定
;;========================================================
(global-set-key (kbd "C-z x") 'rm-kill-region)
(global-set-key (kbd "C-z c") 'rm-kill-ring-save)
(global-set-key (kbd "C-z y") 'yank-rectangle)
(global-set-key (kbd "C-z d") 'delete-rectangle)
(global-set-key (kbd "C-z i") 'string-insert-rectangle)
(global-set-key (kbd "C-z C-i") 'string-rectangle)
(global-set-key (kbd "C-z m") 'rm-set-mark)
