;;ECB设置
;;========================================================
(add-to-list 'load-path (concat plugin-path "/ecb"))
(require 'ecb-autoloads)
;;自动启动ecb
;;(setq ecb-auto-activate t)
;;关闭每日提示
(setq ecb-tip-of-the-day nil
                   ecb-tree-indent   4
                   ecb-windowns-height 0.5
                   ecb-windowns-width 0.20
                   ecb-auto-compatiblity-check nil
                   ecb-version-check nil
               inhibit-startup-message t )
;;按键设置
;;========================================================
;;使某一ecb窗口最大化
(global-set-key (kbd "M-1") 'ecb-maximize-window-directories)
(global-set-key (kbd "M-2") 'ecb-maximize-window-sources)
(global-set-key (kbd "M-3") 'ecb-maximize-window-methods)
(global-set-key (kbd "M-4") 'ecb-maximize-window-history)
;; ;; 恢复原始窗口布局
;; (global-set-key (kbd "M-0") (lambda()
;; 								(ecb-deactivate)
;; 								(ecb-activate)
;; ))
;; F1 : 切换ecb
(global-set-key [(f1)] 'ecb-toggle-ecb-windows)
;;Ctrl-F1 : 启动ecb
(global-set-key [(control f1)] 'ecb-activate)
;;Alt-F1 : 关闭ecb
(global-set-key [(M-f1)] 'ecb-deactivate)
