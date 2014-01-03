;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el --- 
;; 
;; Filename: init.el
;; Description: This is my emacs init.el file
;; Author: pengyz
;; Maintainer: 
;;   pengyz;; Created: 周二 十二月 31 18:59:27 2013 (+0800)
;; Version: 0.06beta
;; Last-Updated: 周五 一月  3 08:56:07 2014 (+0800)
;;           By: pengyz
;;     Update #: 6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;;-----------------------------------------------------------------------------------------
;;Tags Sun May 19 22:41:37 2013
;;Emacs真是魅力无穷，折腾了一整个下午，津津有味。扩展性带来的便利你无法想想参考了网上大量的配置。
;;王垠的Emacs配置文章是我的主要参考对象，里面写了很多东西，对我很有用。
;;-----------------------------------------------------------------------------------------
;;Tags Sun May 12 13:21:31 2013
;;一定要去github下载最新的插件，elpa系统非常难使，从上面下载的包总是配置不正确.yasnippet和ac按键冲突，
;;着急上火了好长时间，最后ac和yas全换成git上的最新版本，问题立马解决
;;-----------------------------------------------------------------------------------------
;;Tags Sun May 19 22:42:02 2013
;;折腾了好长时间emacs了，乱七八糟装了很多东西。ac，yas，ecb，cedet，tabbar等等。现在的emacs已经可以作为一个
;;功能完备的c，c++编译环境了。感觉还是挺不错的。这个周末在鼓捣ruby，挺无奈的。离我创建这个配置文件开始算已经
;;有整整两个周的时间了。期间配置文件丢失过一次，系统重装了一次。现在这份是个重写版。我会时常备份下这个配置文件
;;一防万一。
;;-----------------------------------------------------------------------------------------
;;Tags Sat May 25 12:56:37 2013
;;添加了emms。最近在忙毕设的事情，还有编译。另外准备学习elisp语言作为自己对于编程思想的一个转变。
;;修改了配置文件的组织形式，拆分了子文件。
;;-----------------------------------------------------------------------------------------
;;Wed Sep 11 03:39:25 2013
;;做了一个windows版本的移植，还是比较钟爱emacs
;;emms水土不服
;;不知道该怎样去调用cygwin中的东西，比如说bash,gcc,etc
;;-----------------------------------------------------------------------------------------
;;Thu Oct  3 23:34:24 2013
;;决定继续优化下emacs的配置，明确组织结构，解决快捷键冲突
;;cygwin已经不抱希望了，爱咋咋地吧
;;emacs还是需要持续不断的学习和练习。很明显，现在感觉用起来很不爽，到了要改改的时候了。
;;-----------------------------------------------------------------------------------------
;; Sun Oct 20 21:55:31 2013
;; 修改了快捷键冲突的情况,现在感觉还好.
;; 在学windows驱动编程,ide没配置明白,想用emacs来写,如果能配置emacs的shell可以调用msbuild编译,就更好了.
;; 刚才添加了wdk的inc路径到semantic,可以分析了,但是补全有点问题,可以用semantic补全,但是没办法用autocomplete的,是不是ac配置上还有什么问题```
;; cc-mode中的注释很不爽,无法自动判断区域注释还是行注释.
;; 装了cscope和xcscope,cscope是在cygwin中make install安装的,但是现在都不会用.
;; semantic的分析有时候很傻,能不能做到像vs一样的可以方便地进行代码定义等等的跳转?还是要借助cscope?cscope如何与ecb整合?
;; cc-mode的代码折叠用什么插件好?以前用了hs-mode,但是感觉不是很顺手,用的也很少,折叠不够智能,只能在函数签名上折叠.
;; 矩形编辑还是不太顺手,如果能和正常的区域编辑进行一定的整合就好多了.
;; 
;;-----------------------------------------------------------------------------------------
;; Fri Jan  3 08:53:18 2014
;; 花了一整晚的时间继续配置了emacs
;; 这次的主要变动是增加了基于elpa的包自动安装机制。同时增加了对文件夹的check，避免出错。
;; emms花了很长时间，还是没有弄好。
;; 代码是从网上copy的，具体的写法还没有搞清楚
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;; 
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;; jpk package install list
(setq jpk-package-list
	  '(

		;;=========================================IN USED PKG ====================================================
		auto-complete          ;; an auto complete system can combine with yasnippet and other resourses
		tabbar                 ;; tab pages just like a typical windows style
		yasnippet              ;; yet another snippets --snippet complete system
		ascope                 ;; another cscope additional
		cygwin-mount           ;; an config file for cygwin to mount in windows
		ctypes                 ;; a foced font lock for C/C++
		ecb                    ;; emacs code browser
		expand-region          ;; C-= select region
		tabbar-ruler           ;; tabbar and global ruler
		smex                   ;; M-x complete
		paredit                ;; paren force mode for scheme and other lisp languages
		smartparens            ;; paren auto complete
		dash                   ;; dependcy for smartparens
		browse-kill-ring       ;; browse kill ring and do some option in it
		make-project           ;; not in use
		popup                  ;; dependcy for yasnippet
		header2                ;; insert header info for your file
		session                ;; save edit conditions
		emms                   ;; a mutiple system to use mplayer vlc etc in emacs (It doesn't work now in windows!)
		vlf                    ;; view large file
		lua-mode               ;; lua support
		rect-mark              ;; real retangle mark and edit
		pos-tip                ;; dependcy package for yasnippet provide a tips display
		bind-key		       ;; a simple way to manage personal key bindings
		;;========================================================================================================



		;;=========================================NOT IN USE ====================================================
		;; emacs-setup            ;; help to setup emacs and customize variables
		;; slime                  ;; common-lisp support
		;; git                    ;; git support
		;; f                      ;; dependcy for git
		;; s                      ;; dependcy for git 
		;;========================================================================================================

		))


;;define the base path
(defvar plugin-path "~/.emacs.d/plugins")
(defvar config-path "~/.emacs.d/my-config")
(defvar temp-path "~/.emacs.d/temp")
(defvar plugin-config-path (concat config-path "/plugin-config"))
(defvar elisp-fun-path (concat config-path "/elisp-fun"))

;;define the default open dir for windows
(defvar my-windows-default-dir "F:/")

;;define the default org-publish project path
(defvar org-project-base "F:/Helpers/Xajh/")

;;add the plugin-path to the load-path
(add-to-list 'load-path plugin-path)
(add-to-list 'load-path config-path)
;;define my kbd prefix to use C-z
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)



;;load all the config file frome three path
(mapc 'load (directory-files elisp-fun-path t "\\.el$"))
(mapc 'load (directory-files config-path t "\\.el$"))
(check-temp-dir plugin-path)
(check-temp-dir temp-path)
;;dir change
(setq package-user-dir plugin-path)
;; add source
(jpk-add-source)
;; add load-path
(jpk-load-path-auto)
;; jpk install check
(jpk-package-list-install)
(mapc 'load (directory-files plugin-config-path t "\\.el$"))


;;Custom-set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-name "my-left-analyse")
 '(ecb-options-version "2.40")
 '(ecb-layout-window-sizes (quote (("my-left-analyse" (ecb-methods-buffer-name 0.15822784810126583 . 0.375) (ecb-sources-buffer-name 0.15822784810126583 . 0.2916666666666667) (ecb-analyse-buffer-name 0.15822784810126583 . 0.3125)) ("my-left-speedbar" (ecb-sources-buffer-name 0.189873417721519 . 0.2708333333333333) (ecb-methods-buffer-name 0.189873417721519 . 0.3958333333333333) (ecb-speedbar-buffer-name 0.189873417721519 . 0.3125)) ("my-right-speedbar" (ecb-sources-buffer-name 0.23417721518987342 . 0.2708333333333333) (ecb-speedbar-buffer-name 0.23417721518987342 . 0.2708333333333333) (ecb-methods-buffer-name 0.23417721518987342 . 0.4375)))))
 '(ecb-tip-of-the-day nil)
 '(ecb-version-check nil)
 )

(put 'erase-buffer 'disabled nil)
;; (setq url-configuration-directory (concat temp-path "/url/"))
;; (check-temp-dir url-configuration-directory)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-constant-face ((t (:foreground "yellow"))))
 '(font-lock-function-name-face ((t (:foreground "orange"))))
 '(font-lock-keyword-face ((t (:foreground "steel blue"))))
 '(font-lock-negation-char-face ((t (:background "purple4"))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit bold :background "medium slate blue"))))
 '(font-lock-regexp-grouping-construct ((t (:inherit bold :background "DeepPink3"))))
 '(font-lock-string-face ((t (:foreground "plum"))))
 '(font-lock-type-face ((t (:foreground "cadet blue")))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
