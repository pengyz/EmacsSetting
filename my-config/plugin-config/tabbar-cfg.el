;;tabbarSettings
;;========================================================
(add-to-list 'load-path (concat plugin-path "/tabbar"))
(require 'tabbar)
(tabbar-mode)
(require 'my-tabbar-settings)

(global-set-key (kbd "C-c C-f") 'tabbar-forward-group)
(global-set-key (kbd "C-c C-b") 'tabbar-backward-group)
(global-set-key (kbd "C-c C-p") 'tabbar-forward-tab)
(global-set-key (kbd "C-c C-n") 'tabbar-backward-tab)
