;; cedet config (semantic,ede,etc)
;;========================================================
;;cedet一直没有好好的配置。Emacs24.3自带了cedet2.0，和安装版的cedet在函数上有不少的区别，一直没有好好地配置过。

;;semantic用到的一些函数定义
;;========================================================
;;定义WDK7.1引用根路径
(setq vc_install_dir "C:/Program Files/Microsoft Visual Studio 11.0/VC/")
(setq vc_framework_sdk_dir "C:/Program Files/Microsoft SDKs/Windows/V7.1A/")
(setq wdk_path (getenv "WDKPATH"))
;;定义用户常用引用路径
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
;;定义VC的引用路径表
(defun my-vc-wdk-inc-dir()
  "define the WDK inc dir for semantic"
  (defconst cedet-win32-VC-WDK-include-dirs
	(list (concat wdk_path "inc/ddk")
		  (concat wdk_path "inc/api")
		  (concat wdk_path "inc/crt")
		  (concat wdk_path "inc/wdf")
		  (concat  vc_install_dir "include")
		  (concat vc_install_dir "atlmfc/include")
		  (concat vc_framework_sdk_dir "Include"))))


;;添加semantic引用路径
(defun my-semantic-inc-dir(wdk_dev)
  "when wdk_dev is t and used in windows ,append wdk inc path"
  (interactive "d")
  (require 'semantic-c nil 'NOERROR)

  (let ((include-dirs cedet-user-include-dirs))
	(when (and (eq system-type 'windows-nt) wdk_dev)
	  (my-vc-wdk-inc-dir)  ;;调用my-vc_inc_dir,生成路径列表
	  ;; (my-wdk-inc-dir)  ;;调用my-wdk_inc_dir,生成路径列表
	  (setq include-dirs (append include-dirs cedet-win32-VC-WDK-include-dirs)))
	(mapc (lambda (dir)
			(semantic-add-system-include dir 'c++-mode)
		(semantic-add-system-include dir 'c-mode)
			(semantic-add-system-include dir 'cc-mode))
		  include-dirs))
  (semantic-force-refresh))

;; C/C++语言启动时自动加载semantic对VC和WDK系统头文件的数据库文件
(defun my-semantic-load-db-file()
  "load database files for VC and WDK include"
  (interactive)
  (setq semanticdb-search-system-databases t) ;开启semanticdb搜索系统数据库文件
  (add-hook 'c-mode-common-hook (lambda ()
								  (mapc (lambda (dir)
										  (setq semanticdb-project-system-databases
												(append semanticdb-project-system-databases 
														(semanticdb-create-database
														 semanticdb-new-database-class 
														 dir))))
										(if (eq system-type 'windows-nt)
										    cedet-win32-VC-WDK-include-dirs
										  "/usr/include")))))

;;使用系统数据库
(defun my-semantic-system-database()
  "use the system-database for VC and MFC head files"
  (interactive)
  (my-vc-wdk-inc-dir)
  (lambda ()
	(mapc ((lambda (dir) 
			 (semanticdb-create-ebrowse-database dir)
			 )))
	(cedet-win32-VC-WDK-include-dirs)))


;;CEDET Settings Start
;;========================================================
(require 'cedet)
;;semantic-mode 设置
;;========================================================
;;开启回显区摘要显示
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
;;开启semantic补全
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
;;开启函数下划线标识
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode t)
;;开启semantic书签模式
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode t)
;;开启unmatch syntax标识
;; (add-to-list 'semantic-default-submodes 'global-semantic-show-unmatched-syntax-mode 1)
;;开启当前函数高亮
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode 1)
;;开启空闲分析
(add-to-list 'semantic-default-submodes 'semantic-idle-scheduler-mode 3)
;;开启当前编辑高亮
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-edits-mode (if window-system 1 -1))
;;开启当前分析状态显示
(add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode 1)
;;开启符号参考高亮
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode 1)
;;开启面包屑显示
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-breadcrumbs-mode 1)

;; 启用semantic
(semantic-mode t)

;; 避免semantic占用CPU过多
(setq-default semantic-idle-scheduler-idle-time 432000)

;;semantic-ia设置
;;========================================================
(require 'semantic/ia)
(setq-mode-local c-mode semanticdb-find-default-throttle '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle '(project unloaded system recursive))

;;TAGS Menu
;;========================================================
(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

;; 使用 gnu global 的TAGS。
;;========================================================
;; (require 'semantic/db-global)
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)


;;缩进或者补齐
;;========================================================
;;; hippie-try-expand settings
(setq hippie-expand-try-functions-list
      '(
        yas/hippie-try-expand
        semantic-ia-complete-symbol
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs))

(defun indent-or-complete ()
  "Complete if point is at end of a word, otherwise indent line."
  (interactive)
  (if (looking-at "\\>")
      (hippie-expand nil)
    (indent-for-tab-command)
    ))

(defun yyc/indent-key-setup ()
  "Set tab as key for indent-or-complete"
  (local-set-key  (kbd "<tab>") 'indent-or-complete))

;;结构体补全========================================================
(defun yyc/c-mode-keys ()
  "description"
  ;; Semantic functions.
  (semantic-default-c-setup)
  (local-set-key (kbd "C-c ?") 'semantic-ia-complete-symbol-menu)
  (local-set-key (kbd "C-c b") 'semantic-mrub-switch-tags)
  (local-set-key (kbd "C-c R") 'semantic-symref)
  (local-set-key (kbd "C-c j") 'semantic-ia-fast-jump)
  (local-set-key (kbd "C-c p") 'semantic-ia-show-summary)
  (local-set-key (kbd "C-c l") 'semantic-ia-show-doc)
  (local-set-key (kbd "C-c r") 'semantic-symref-symbol)
  (local-set-key (kbd "C-c /") 'semantic-ia-complete-symbol)
  (local-set-key (kbd "C-<return>") 'semantic-ia-complete-symbol)
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert)
  ;; Indent or complete
  (local-set-key  (kbd "<tab>") 'indent-or-complete)
  )
(add-hook 'c-mode-common-hook 'yyc/c-mode-keys)

;; 启用EDE用于工程管理
(global-ede-mode 1)

;;设置WDK的include路径(貌似没有什么作用)
(my-semantic-inc-dir t)
;;设置semantic数据库存储位置
(setq semantic-db-dir (concat temp-path "/semanticDB"))
(check-temp-dir semantic-db-dir)
(setq semanticdb-default-save-directory (expand-file-name semantic-db-dir))


;; 配置Semantic的检索范围:
;; (setq semanticdb-project-roots 
;; 	  (list
;; 	   (expand-file-name "F:/")))
;; 配置semantic的库文件数据库
(my-semantic-system-database)
;; 设置speedbar使用semantic/db
(add-hook 'speedbar-load-hook (lambda () 
								(require 'semantic/sb)))


;;快捷键配置
;;========================================================
;;F12 转到定义
(define-key semantic-mode-map (kbd "<f12>") 'semantic-ia-fast-jump)
;;M-Mouse1 转到定义
(define-key semantic-mode-map (kbd "M-<down-mouse-1>") 'semantic-ia-fast-mouse-jump)
;;push-mark bug fix
(defadvice push-mark (around semantic-mru-bookmark activate)
  "Push a mark at LOCATION with NOMSG and ACTIVATE passed to `push-mark'.
If `semantic-mru-bookmark-mode' is active, also push a tag onto
the mru bookmark stack."
  (semantic-mrub-push semantic-mru-bookmark-ring
                      (point)
                      'mark)
  ad-do-it)

;;semantic-ia-jmp-back
(define-key semantic-mode-map (kbd "S-<f12>")
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
;;semantic-ia-jmp-or-back
(define-key semantic-mode-map (kbd "C-<f12>")
  (lambda (&optional back)
	(interactive "P")
	(if back
		(semantic-ia-fast-jump-back)
	  (semantic-ia-fast-jump (point)))))

