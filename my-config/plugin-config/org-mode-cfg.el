;;org-mode设置
;;========================================================
(add-to-list 'load-path "~/.emacs.d/plugins/org/lisp")
(add-to-list 'load-path "~/.emacsd/plugins/org/contrib/lisp" t)
;;中文自动折行
(add-hook 'org-mode-hook (lambda () 
						   (setq truncate-lines nil)
							(show-paren-mode -1)))
;;默认开启indent模式
(setq org-startup-indented t)
;;设置tudo item记录
(setq org-log-done 'time)
(setq org-log-done 'note)
;;publish具体设置
(setq org-publish-project-alist'(
								 ("note-txt"
								  :base-directory (concat org-project-base "doc/org")
								  :publishing-directory (concat org-project-base "doc/org-publish/txt")
								  :base-extension "org"
								  :recursive t
								  :publishing-function org-publish-org-to-ascii
								  :auto-index nil
								  :index-title "目录"
								  :section-numbers t)
								 ("note-org"
								  :base-directory (concat org-project-base "doc/org")
								  :publishing-directory (concat org-project-base "doc/org-publish/html")
								  :base-extension "org"
								  :recursive t
								  :publishing-function org-publish-org-to-html
								  :auto-index nil
								  :index-filename "index.org"
								  :index-title "index"
								  :link-home "index.html"
								  :section-numbers nil
								  :style "<link rel=\"stylesheet\" href=\"./style/emacs.css\" type=\"text/css\"/>")
								 ("note-static"
								  :base-directory (concat org-project-base "doc/org")
								  :publishing-directory  (concat org-project-base "doc/org-publish/attachment")
								  :recursive t
								  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
								  :publishing-function org-publish-attachment)
								 ("note" 
								  :components ("note-org note-static")
								  :author "pengyz-orangekbb@gmail.com"
								  )
								 ;;git文档发布模板
								 ("git-doc" 
								  :components ("note-static" "note-txt")
								  :author "逝水流年-orangekbb@gmail.com"
								  )
))
