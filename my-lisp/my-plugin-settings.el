;;;;Plugin-Settings start here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;添加包服务器
;;========================================
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalage" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;;添加搜索路径
;;========================================================
(add-to-list 'load-path "~/.emacs.d/plugins")
;;(let* ((my-plugin-dir "~/.emacs.d/plugins") 
;;       (default-directory my-plugin-dir)) 
;;  (setq load-path (cons my-plugin-dir load-path)) 
;;  (normal-top-level-add-subdirs-to-load-path)) 


;;设置ido(增强的文件文件搜插件)
;;========================================================
(require 'ido)
(ido-mode t)
;;设置Session
;;========================================================
(require 'session) 
(load "~/.emacs.d/plugins/session.el")
(add-hook 'after-init-hook 'session-initialize) 

;;设置desktop.el
;;========================================================
(load "desktop")
;;设置desktop的保存路径
;; (setq desktop-path '("~/.emacs.d/temp/desktop"))
;; (setq desktop-dirname "~/.emacs.d/temp/desktop")
;; (setq desktop-base-file-name ".emacs-desktop")
;;设置自动保存
;;(desktop-save-mode 1)
(desktop-load-default) 
(desktop-read) 

;;开启版本控制
;;========================================================
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)

;;代码折叠
;;========================================================
(add-hook 'c-mode-common-hook
          (lambda ()
            (hs-minor-mode 1)
            ))

(add-hook 'emacs-lisp-mode-hook
          (lambda()
            (hs-minor-mode 1)))

;;设置Yasnippet
;;========================================================
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-load-directory "~/.emacs.d/plugins/yasnippet/snippets")
(yas-global-mode 1)
(yas-minor-mode-on)

;;设置auto-complete-mode
;;========================================================
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(add-to-list 'load-path "~/.emacs.d/plugins/popup")
;;(require 'auto-complete)
(require 'auto-complete-config)
;;设置字典路径
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/ac-dict")
;;使用增强列表
(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip)
;;启用默认ac设置
(ac-config-default)
(auto-complete-mode 1)
;;添加backspac触发列表
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))
;;使用帮助模式
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)
;;yas-ac设置
(defface ac-yasnippet-candidate-face
  '((t (:background "sandybrown" :foreground "black")))
  "Face for yasnippet candidate.")
 
(defface ac-yasnippet-selection-face
  '((t (:background "coral3" :foreground "white")))
  "Face for the yasnippet selected candidate.")
 
(defvar ac-source-yasnippet
  '((candidates . ac-yasnippet-candidate)
    (action . yas/expand)
    (candidate-face . ac-yasnippet-candidate-face)
    (selection-face . ac-yasnippet-selection-face))
  "Source for Yasnippet.")

;;cscope设置
;;(require 'xcscope)

;;Cedit设置
;;========================================================
(global-ede-mode t )
;;设置browser-kill-ring
;;========================================================
(require 'browse-kill-ring)
(global-set-key (kbd "C-c C-r") 'browse-kill-ring)
;;(browse-kill-ring-default-bindings)		
;;ECB设置
;;========================================================
(add-to-list 'load-path "~/.emacs.d/plugins/ecb")
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
;;按键设置
;;;; 各窗口间切换
(global-set-key [C-left] 'windmove-left)
(global-set-key [C-right] 'windmove-right)
(global-set-key [C-up] 'windmove-up)
(global-set-key [C-down] 'windmove-down)
;;使某一ecb窗口最大化
(define-key global-map "\M-1" 'ecb-maximize-window-directories)
(define-key global-map "\M-2" 'ecb-maximize-window-sources)
(define-key global-map "\M-3" 'ecb-maximize-window-methods)
(define-key global-map "\M-4" 'ecb-maximize-window-history)
;;;; 恢复原始窗口布局
(define-key global-map "\M-0" 'ecb-restore-default-window-sizes)

;;cedet设置
;;========================================================
;; (load-file "~/.emacs.d/plugins/cedet/cedet-devel-load.el")
;; Add further minor-modes to be enabled by semantic-mode.
;; See doc-string of `semantic-default-submodes' for other things
;; you can use here.
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
;;(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)

          ;; Enable Semantic
          (semantic-mode 1)

          ;; Enable EDE (Project Management) features
          (global-ede-mode 1)

;; ;;rect-mark设置
;; (require 'rect-mark)


;;列编辑
;;========================================================
(require 'rect-mark)
(global-set-key (kbd "C-c C-w") 'rm-kill-region)
(global-set-key (kbd "C-c M-w") 'rm-kill-ring-save)
(global-set-key (kbd "C-c C-y") 'yank-rectangle)
(global-set-key (kbd "C-c C-M-d") 'delete-rectangle)
(global-set-key (kbd "C-c C-i") 'string-insert-rectangle)
(global-set-key (kbd "C-c C-M-i") 'string-rectangle)
(global-set-key (kbd "C-c C-SPC") 'rm-set-mark)

;;emms
;;========================================================
(add-to-list 'load-path "~/.emacs.d/plugins/emms")
(add-to-list 'load-path "~/.emacs.d/plugins/emms/lisp")
(require 'emms-setup)
(require 'emms-source-playlist)
;;S(setq exec-path (append exec-path '("F:/我的软件/MPlayer for Windows")))
(emms-standard)
(emms-default-players)
;; global key-map
;; all global keys prefix is C-c e
;; compatible with emms-playlist mode keybindings
;; you can view emms-playlist-mode.el to get details about 
;; emms-playlist mode keys map
(global-set-key (kbd "C-c e s") 'emms-stop)
(global-set-key (kbd "C-c e P") 'emms-pause)
(global-set-key (kbd "C-c e n") 'emms-next)
(global-set-key (kbd "C-c e p") 'emms-previous)
(global-set-key (kbd "C-c e f") 'emms-show)
(global-set-key (kbd "C-c e >") 'emms-seek-forward)
(global-set-key (kbd "C-c e <") 'emms-seek-backward)
;; these keys maps were derivations of above keybindings
(global-set-key (kbd "C-c e S") (lambda () "加载F:/Music，显示播放列表并暂停" 
						 (interactive)
						 (emms-play-directory-tree "F:/Music")
						 (emms-playlist-mode-go)
						 (emms-pause)))
(global-set-key (kbd "C-c e g") 'emms-playlist-mode-go)
(global-set-key (kbd "C-c e t") 'emms-play-directory-tree)
(global-set-key (kbd "C-c e h") 'emms-shuffle)
(global-set-key (kbd "C-c e e") 'emms-play-file)
(global-set-key (kbd "C-c e l") 'emms-play-playlist)
(global-set-key (kbd "C-c e r") 'emms-toggle-repeat-track)
(global-set-key (kbd "C-c e R") 'emms-toggle-repeat-playlist)
(global-set-key (kbd "C-c e u") 'emms-score-up-playing)
(global-set-key (kbd "C-c e d") 'emms-score-down-playing)
(global-set-key (kbd "C-c e o") 'emms-score-show-playing)

;;ruby-mode
;;========================================================
(add-to-list 'load-path "~/.emacs.d/plugins/ruby")
(autoload 'ruby-mode "ruby-mode"  
  "Mode for editing ruby source files" t)  
(setq auto-mode-alist  
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))  
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))  
                                     interpreter-mode-alist))  
(autoload 'run-ruby "inf-ruby"  
  "Run an inferior Ruby process")  
(autoload 'inf-ruby-keys "inf-ruby"  
  "Set local key defs for inf-ruby in ruby-mode")  
(add-hook 'ruby-mode-hook  
          '(lambda ()  
             (inf-ruby-keys)))

;; (smart-tabs-advice vhdl-indent-line vhdl-basic-offset)
;;     (setq vhdl-indent-tabs-mode t)

;;tabbarSettings
;;========================================================
(add-to-list 'load-path "~/.emacs.d/plugins/tabbar")
(require 'tabbar)
(tabbar-mode)
(require 'my-tabbar-settings)

(global-set-key (kbd "C-c C-f") 'tabbar-forward-group)
(global-set-key (kbd "C-c C-b") 'tabbar-backward-group)
(global-set-key (kbd "C-c C-p") 'tabbar-forward-tab)
(global-set-key (kbd "C-c C-n") 'tabbar-backward-tab)

;;railsSettings
;;========================================================
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-rails")
(add-to-list 'load-path "~/.emacs.d/plugins/inf-ruby")
(require 'rails-autoload)
 
;;smartparen
;;========================================================
(add-to-list 'load-path "~/.emacs.d/plugins/smartparens")
(add-to-list 'load-path "~/.emacs.d/plugins/dash")
(require 'smartparens-config)

;;smex
;;========================================================
(add-to-list 'load-path "~/.emacs.d/plugins/smex")
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c C-m") 'smex-major-mode-commands)

;;expand-region
;;========================================================
(add-to-list 'load-path "~/.emacs.d/plugins/expand-region")
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;;Cygwin
;;========================================================
;; 加载cygwin 
(setenv "PATH" (concat "D:/Cygwin/bin" (getenv "PATH"))) 
(setq exec-path (cons "D:/Cygwin/bin" exec-path)) 
(require 'cygwin-mount) 
(cygwin-mount-activate) 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'comint-output-filter-functions                                       
                    'shell-strip-ctrl-m nil t)                                                  
(add-hook 'comint-output-filter-functions                                       
                   'comint-watch-for-password-prompt nil t)                                    
(setq explicit-shell-file-name "bash.exe")                                      
;; For subprocesses invoked via the shell                                       
;; (e.g., "shell -c command")                                                   
(setq shell-file-name explicit-shell-file-name) 

;;;;Plugin-Settings end here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
