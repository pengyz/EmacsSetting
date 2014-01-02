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


;;按键设置
;;========================================================
;;使某一ecb窗口最大化
;; (global-set-key (kbd "M-1") 'ecb-maximize-window-directories)
;; (global-set-key (kbd "M-2") 'ecb-maximize-window-sources)
;; (global-set-key (kbd "M-3") 'ecb-maximize-window-methods)
;; (global-set-key (kbd "M-4") 'ecb-maximize-window-history)
;; ;;自动启动ecb
;; (add-hook 'after-init-hook (lambda()
;; 							 (ecb-activate)
;; 							 (ecb-hide-ecb-windows)))
;; F1 : 开启-关闭ecb
;; (global-set-key [(f1)] 'ecb-toggle-ecb-windows)
(setq ecb-minor-mode nil)
(global-set-key (kbd "<f1>") (lambda ()
							   (interactive)
							   (if ecb-minor-mode
								   (ecb-deactivate)
								 (ecb-activate)
								 )))
