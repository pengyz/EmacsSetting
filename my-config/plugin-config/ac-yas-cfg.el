;;设置Yasnippet
;;========================================================
;; (defun my-ac-yas-cfg ()
"my ac-yas confg fun that load the ac-yas settings"
(interactive)
;; (add-to-list 'load-path (concat plugin-path "/yasnippet"))
(require 'yasnippet)
;; (yas-load-directory (concat plugin-path "/yasnippet/snippets"))
(yas-global-mode 1)
;;设置auto-complete-mode
;;========================================================
;; (add-to-list 'load-path (concat plugin-path "/auto-complete"))
;; (add-to-list 'load-path (concat plugin-path "/popup"))
(require 'auto-complete)
(require 'auto-complete-config)		
;;设置字典路径
;; (add-to-list 'ac-dictionary-directories (concat plugin-path "/auto-complete/ac-dict"))
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
;;开启ac-dwin
(setq ac-dwim t)
;;设置ac数据文件位置
(setq ac-comphist-file (concat temp-path "/ac-comphist/ac-comphist.dat"))
(check-temp-dir(concat temp-path "/ac-comphist/"))
;;添加ac补全源
(set-default 'ac-sources
			 '(ac-source-semantic ;;ac使用semantic的分析结果
			   ac-source-yasnippet
			   ac-source-abbrev
			   ac-source-words-in-buffer
			   ac-source-words-in-all-buffer
			   ac-source-imenu
			   ac-source-files-in-current-dir
			   ac-source-filename))

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

;; )


;; (global-set-key (kbd "<f11>") (lambda ()
;; 								"just load ac-yas snippets"
;; 								(interactive)
;; 								(my-ac-yas-cfg)
;; 								;; (my-semantic-inc-dir nil)
;; ))
