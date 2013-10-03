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

;; ;;窗口布局
;; (ecb-layout-define "my-cscope-layout" left nil
;;                    (ecb-set-methods-buffer)
;;                    (ecb-split-ver 0.5 t)
;;                    (other-window 1)
;;                    (ecb-set-sources-buffer)
;;                    (ecb-split-ver 0.5 t)
;;                    (other-window 1)
;;                    (ecb-set-cscope-buffer))

;; (defecb-window-dedicator ecb-set-cscope-buffer " *ECB cscope-buf*"
;;                          (switch-to-buffer "*cscope*"))

;; (setq ecb-layout-name "my-cscope-layout")

;; ;; Disable buckets so that history buffer can display more entries
;; (setq ecb-history-make-buckets 'never)


;;按键设置
;;========================================================
;;使某一ecb窗口最大化
(define-key global-map "\M-1" 'ecb-maximize-window-directories)
(define-key global-map "\M-2" 'ecb-maximize-window-sources)
(define-key global-map "\M-3" 'ecb-maximize-window-methods)
(define-key global-map "\M-4" 'ecb-maximize-window-history)
;;;; 恢复原始窗口布局
(define-key global-map "\M-0" 'ecb-restore-default-window-sizes)
;;F1 : 打开ecb
;; 启动时开启ecb并隐藏，太慢了，否决
;; (add-hook 'after-init-hook (lambda()
;; 							  (interactive)
;; 							  (ecb-activate)
;; 							  (ecb-toggle-ecb-windows)
;; ))

;; 按F1启动ECB并隐藏，需要按2次F1才能显示ECB窗口
(global-set-key [(f1)] (lambda()
							  (interactive)
							  (ecb-activate)
							  (ecb-toggle-ecb-windows)
))
;;Ctrl-F1 : 关闭ecb
(global-set-key [(control f1)] 'ecb-deactivate)
;;Alt-F1 : 重置ecb窗口
(global-set-key [(M-f1)] 'ecb-restore-default-window-sizes)
