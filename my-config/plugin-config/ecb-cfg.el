;;ECB设置
;;========================================================
(add-to-list 'load-path (concat plugin-path "/ecb"))
(require 'ecb-autoloads)
;;关闭每日提示
(setq ecb-tip-of-the-day nil
                   ecb-tree-indent   4
                   ecb-windowns-height 0.5
                   ecb-windowns-width 0.20
                   ecb-auto-compatiblity-check nil
                   ecb-version-check nil)
;;semantic设置
;;========================================================
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)

;; 启用semantic
(semantic-mode t)
;; 启用EDE用于工程管理
(global-ede-mode 1)
;;下划线标明函数
(global-semantic-decoration-mode 1)
;;当前函数高亮
(global-semantic-highlight-func-mode 1)
;;开启semantic书签模式
(global-semantic-mru-bookmark-mode 1)
;;设置WDK的include路径(貌似没有什么作用)
(my-semantic-inc-dir t)
;; 关闭ecb的directories-make-buckets
(setq ecb-history-make-buckets 'never)

;;设置semantic数据库存储位置
(setq semanticdb-default-save-directory "~/.emacs.d/semanticDB")

;; 配置Semantic的检索范围:
(setq semanticdb-project-roots 
	  (list
	   (expand-file-name "E:/")))
;; 配置semantic的库文件数据库
(my-semantic-load-db-file)

;; 设置speedbar使用semantic/db
(add-hook 'speedbar-load-hook (lambda () 
								(require 'semantic/sb)))

;;按键设置
;;========================================================
;;使某一ecb窗口最大化
(global-set-key (kbd "M-1") 'ecb-maximize-window-directories)
(global-set-key (kbd "M-2") 'ecb-maximize-window-sources)
(global-set-key (kbd "M-3") 'ecb-maximize-window-methods)
(global-set-key (kbd "M-4") 'ecb-maximize-window-history)
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
								 ;; 开启speedbar分析
								  ;; (semantic-speedbar-analysis)
)))
;;F12 转到定义
(global-set-key (kbd "<f12>") 'semantic-ia-fast-jump)
;;M-Mouse1 转到定义
(global-set-key (kbd "M-<down-mouse-1>") 'semantic-ia-fast-mouse-jump)


(global-set-key (kbd "S-<f12>")
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                       (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))
