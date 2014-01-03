;;smex
;;============================================================
;; (add-to-list 'load-path (concat plugin-path "/smex"))
(require 'smex)
(smex-initialize)
(setq smex-dir (concat temp-path  "/smex"))
(if(not (file-exists-p smex-dir))
	(make-directory smex-dir))
(setq smex-save-file (concat smex-dir "/.smex-items"))

;; smex键绑定
;;=============================================================
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c m") 'smex-major-mode-commands)
