;;设置Yasnippet
;;========================================================
(add-to-list 'load-path (concat plugin-path "/yasnippet"))
(require 'yasnippet)
(yas-load-directory (concat plugin-path "/snippets"))
(yas-global-mode 1)
(yas-minor-mode-on)
;;设置auto-complete-mode
;;========================================================
(add-to-list 'load-path (concat plugin-path "/auto-complete"))
(add-to-list 'load-path (concat plugin-path "/popup"))
;;(require 'auto-complete)
(require 'auto-complete-config)
;;设置字典路径
(add-to-list 'ac-dictionary-directories (concat plugin-path "/auto-complete/ac-dict"))
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
