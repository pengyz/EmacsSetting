;;ECB设置
;;========================================================
(require 'ecb-autoloads)
;;关闭每日提示
(setq ecb-tip-of-the-day nil
                   ecb-tree-indent   4
                   ecb-windowns-height 0.5
                   ecb-windowns-width 0.20
                   ecb-auto-compatiblity-check nil
                   ecb-version-check nil)

;; 关闭ecb的directories-make-buckets
(setq ecb-history-make-buckets 'never)
;; 设置ede项目缓存文件路径
(setq ede-project-placeholder-cache-file (concat temp-path "/ede-projects/ede-projects.el"))
(check-temp-dir (concat temp-path "/ede-projects/"))
;; 设置ecb用户自定义模板文件路径
(setq ecb-create-layout-file (concat config-path "/ecb-layout/.ecb-user-layouts.el"))
(check-temp-dir (concat config-path "/ecb-layout/"))
;; 设置ecb鼠标模式
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))

;; F1 : 开启-关闭ecb
;; (global-set-key [(f1)] 'ecb-toggle-ecb-windows)
(setq ecb-minor-mode nil)
(global-set-key (kbd "<f1>") (lambda ()
							   (interactive)
							   (if ecb-minor-mode
								   (ecb-deactivate)
								 (ecb-activate)
								 )))
