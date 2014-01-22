;;cedet一直没有好好的配置。Emacs24.3自带了cedet2.0，和安装版的cedet在函数上有不少的区别，一直没有好好地配置过。

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
                                            ;; cedet-win32-VC-WDK-include-dirs
                                            semantic-c-dependency-system-include-path
                                          "/usr/include")))))

;;使用系统数据库
(defun my-semantic-use-system-database()
  "use the system-database for VC and MFC head files"
  (interactive)
  ;; (my-vc-wdk-inc-dir)
  (lambda ()
    (mapc ((lambda (dir) 
             (semanticdb-create-ebrowse-database dir))))
    (semantic-c-dependency-system-include-path)))
