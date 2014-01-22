;;load all the config file frome three path
;; set personal funtion define root dir
(setq per-fun-dir (concat user-emacs-directory "personal/preload/per-funs/"))
;; (setq per-pkg-dir (concat user-emacs-directory "personal/perpkg/"))
(add-to-list 'load-path per-fun-dir)
;;(add-to-list 'load-path per-pkg-dir)
;; load all function defination
(mapc 'load (directory-files per-fun-dir t "\\.el$"))
;; add pkg subdir to load-path
;; (jpk-load-path-auto per-pkg-dir)
