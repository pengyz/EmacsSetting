5;;类似lispbox，配置slime，quickLisp，CCL

;;slime设置
;;================================================================
(add-to-list 'load-path (concat plugin-path "/slime"))
(require 'slime)
(slime-mode 1)
