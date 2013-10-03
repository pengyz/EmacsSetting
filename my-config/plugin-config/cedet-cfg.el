;;cedet设置
;;========================================================

;; (load-file "~/.emacs.d/plugins/cedet/cedet-devel-load.el")
;; Add further minor-modes to be enabled by semantic-mode.
;; See doc-string of `semantic-default-submodes' for other things
;; you can use here.
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
;;(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)

;; Enable cedet-global-mode
(global-ede-mode t )

;; Enable Semantic
(semantic-mode 1)

;; Enable EDE (Project Management) features
(global-ede-mode 1)





;; (smart-tabs-advice vhdl-indent-line vhdl-basic-offset)
;;     (setq vhdl-indent-tabs-mode t)
