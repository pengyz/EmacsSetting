;;列编辑
;;========================================================
(require 'rect-mark)
;;列编辑键绑定
;;========================================================
(global-set-key (kbd "C-c r C-w") 'rm-kill-region)
(global-set-key (kbd "C-c r M-w") 'rm-kill-ring-save)
(global-set-key (kbd "C-c r C-y") 'yank-rectangle)
(global-set-key (kbd "C-c r C-M-d") 'delete-rectangle)
(global-set-key (kbd "C-c r C-i") 'string-insert-rectangle)
(global-set-key (kbd "C-c r C-M-i") 'string-rectangle)
(global-set-key (kbd "C-c r C-m") 'rm-set-mark)
