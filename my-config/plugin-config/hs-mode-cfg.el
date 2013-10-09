;;代码折叠
;;========================================================
(add-hook 'c-mode-common-hook
          (lambda ()
            (hs-minor-mode 1)
            ))

(add-hook 'emacs-lisp-mode-hook
          (lambda()
            (hs-minor-mode 1)))
;;代码折叠键绑定
;;========================================================
;;F2 : 切换当前块折叠状态
(global-set-key [(f2)] 'hs-toggle-hiding)
;;Ctrl-F2 :全部折叠
(global-set-key [(control f2)] 'hs-hide-all)
;;Alt-F2 : 全部显示
(global-set-key [(M-f2)] 'hs-show-all)
