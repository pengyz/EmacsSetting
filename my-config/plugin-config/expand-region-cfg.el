;;expand-region
;;========================================================
(add-to-list 'load-path (concat plugin-path "/expand-region"))
(require 'expand-region)
;; expand-region键绑定
;;====================================================
(global-set-key (kbd "C-=") 'er/expand-region)

