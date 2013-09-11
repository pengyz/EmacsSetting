;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;        Emacs24 Settings           ;;;;;;
;;;;;;        Author    pengyz           ;;;;;;
;;;;;;        Time    2013.5.5           ;;;;;;
;;;;;;        version    0.0.1           ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;-----------------------------------------------------------------------------------------
;;Tags Sun May 19 22:41:37 2013
;;Emacs真是魅力无穷，折腾了一整个下午，津津有味。扩展性带来的便利你无法想想参考了网上大量的配置。
;;王垠的Emacs配置文章是我的主要参考对象，里面写了很多东西，对我很有用。

;;-----------------------------------------------------------------------------------------
;;Tags Sun May 12 13:21:31 2013

;;一定要去github下载最新的插件，elpa系统非常难使，从上面下载的包总是配置不正确.yasnippet和ac按键冲突，
;;着急上火了好长时间，最后ac和yas全换成git上的最新版本，问题立马解决


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;        Emacs24 Settings           ;;;;;;
;;;;;;        Author    pengyz           ;;;;;;
;;;;;;        Time   2013.5.19           ;;;;;;
;;;;;;        version    0.0.2           ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;-----------------------------------------------------------------------------------------
;;Tags Sun May 19 22:42:02 2013

;;折腾了好长时间emacs了，乱七八糟装了很多东西。ac，yas，ecb，cedet，tabbar等等。现在的macs已经可以作为一个
;;功能完备的c，c++编译环境了。感觉还是挺不错的。这个周末在鼓捣ruby，挺无奈的。离我创建这个配置文件开始算已经
;;有整整两个周的时间了。期间配置文件丢失过一次，系统重装了一次。现在这份是个重写版。我会时常备份下这个配置文件
;;一防万一。


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;        Emacs24 Settings           ;;;;;;
;;;;;;        Author    pengyz           ;;;;;;
;;;;;;        Time   2013.5.25           ;;;;;;
;;;;;;        version    0.0.3           ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;-----------------------------------------------------------------------------------------
;;Tags Sat May 25 12:56:37 2013

;;添加了emms。最近在忙毕设的事情，还有编译。另外准备学习elisp语言作为自己对于编程思想的一个转变。
;;修改了配置文件的组织形式，拆分了子文件。


;;Color-settings
(if 'file-exists-p (load-file "~/.emacs.d/my-lisp/my-color-settings.el"))
;;UI-settings
(if 'file-exists-p (load-file "~/.emacs.d/my-lisp/my-ui-settings.el"))
;;Font-and-coding settings
(if 'file-exists-p (load-file "~/.emacs.d/my-lisp/my-font-and-coding-settings.el"))
;;Plugin-settings 
(if 'file-exists-p (load-file "~/.emacs.d/my-lisp/my-plugin-settings.el"))
;;Key-binding-settings
(if 'file-exists-p (load-file "~/.emacs.d/my-lisp/my-kbd-settings.el"))
;;Shell-settings
;;(if 'file-exists-p (load-file "~/.emacs.d/my-lisp/my-shell-settings.el"))
;;Custom-set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ede-project-directories (quote ("/home/peng/MyProjects/C51")))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
