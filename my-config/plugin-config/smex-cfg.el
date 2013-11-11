;;smex
;;============================================================
(add-to-list 'load-path (concat plugin-path "/smex"))
(require 'smex)
(smex-initialize)
;; smex键绑定
;;=============================================================
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c C-m") 'smex-major-mode-commands)
