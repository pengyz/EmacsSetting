;;smex
;;============================================================
;; (add-to-list 'load-path (concat plugin-path "/smex"))
(require 'smex)
(smex-initialize)
(setq smex-save-file (concat temp-path  "/.smex-items"))

;; smex键绑定
;;=============================================================
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c m") 'smex-major-mode-commands)
