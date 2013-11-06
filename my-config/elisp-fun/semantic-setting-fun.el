;;定义WDK7.1引用根路径
(setq vc_install_dir "C:/Program Files/Microsoft Visual Studio 10.0/VC/")
(setq vc_framework_sdk_dir "C:/Program Files/Microsoft SDKs/Windows/V7.0A/")
(setq wdk_path (getenv "WDKPATH"))
;;定义用户常用引用路径
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
;;定义WDK和VC的引用路径表
(defun my-wdk_vc-inc-dir()
  "define the WDK inc dir for semantic"
  (defconst cedet-win32-WDK_VC-include-dirs
	(list (concat wdk_path "inc/ddk")
		  (concat wdk_path "inc/api")
		  (concat wdk_path "inc/crt")
		  (concat wdk_path "inc/wdf")
		  (concat  vc_install_dir "include")
		  (concat  vc_install_dir "atlmfc/include")
		  (concat vc_framework_sdk_dir "include"))))
;;调用my-wdk_vc_inc_dir,生成路径列表
(my-wdk_vc-inc-dir)

;;添加semantic引用路径
(defun my-semantic-inc-dir(wdk_dev)
  "when wdk_dev is t and used in windows ,append wdk inc path"
  (interactive "d")
  (require 'semantic-c nil 'NOERROR)
  (let ((include-dirs cedet-user-include-dirs))
	(when (and (eq system-type 'windows-nt) wdk_dev)
	  (setq include-dirs (append include-dirs cedet-win32-WDK_VC-include-dirs)))
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
											cedet-win32-WDK_VC-include-dirs
										  "/usr/include")))))
