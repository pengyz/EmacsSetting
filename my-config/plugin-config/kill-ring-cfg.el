;;设置browser-kill-ring
;;========================================================
(require 'browse-kill-ring)
(global-set-key (kbd "C-z  C-k") 'browse-kill-ring)
;;设置分行显示
(setq browse-kill-ring-display-style 'separated)
;;高亮当前实体
(setq browse-kill-ring-highlight-current-entry t)
;;下次剪切操作前将外部程序内容保存到kill-ring
(setq save-interprogram-paste-before-kill t)
