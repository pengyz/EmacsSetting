;;emms
;;========================================================
(add-to-list 'load-path (concat plugin-path "/emms"))
(add-to-list 'load-path (concat plugin-path "/emms/lisp"))
(require 'emms-setup)
(require 'emms-source-playlist)

(if (equal system-type 'windows-nt)
	(setq exec-path (append exec-path '("D:/常用软件/SMPlayer/mplayer"))))

(emms-all)
(emms-default-players)


;; emms键绑定
;;========================================================
;; global key-map
;; all global keys prefix is C-c e
;; compatible with emms-playlist mode keybindings
;; you can view emms-playlist-mode.el to get details about 
;; emms-playlist mode keys map
(global-set-key (kbd "C-c e s") 'emms-stop)
(global-set-key (kbd "C-c e P") 'emms-pause)
(global-set-key (kbd "C-c e n") 'emms-next)
(global-set-key (kbd "C-c e p") 'emms-previous)
(global-set-key (kbd "C-c e f") 'emms-show)
(global-set-key (kbd "C-c e >") 'emms-seek-forward)
(global-set-key (kbd "C-c e <") 'emms-seek-backward)
;; these keys maps were derivations of above keybindings
(global-set-key (kbd "C-c e S") (lambda () "加载D:\歌曲，显示播放列表并暂停" 
						 (interactive)
						 (emms-play-directory-tree "D:/歌曲")
						 (emms-playlist-mode-go)
						 (emms-pause)))
(global-set-key (kbd "C-c e g") 'emms-playlist-mode-go)
(global-set-key (kbd "C-c e t") 'emms-play-directory-tree)
(global-set-key (kbd "C-c e h") 'emms-shuffle)
(global-set-key (kbd "C-c e e") 'emms-play-file)
(global-set-key (kbd "C-c e l") 'emms-play-playlist)
(global-set-key (kbd "C-c e r") 'emms-toggle-repeat-track)
(global-set-key (kbd "C-c e R") 'emms-toggle-repeat-playlist)
(global-set-key (kbd "C-c e u") 'emms-score-up-playing)
(global-set-key (kbd "C-c e d") 'emms-score-down-playing)
(global-set-key (kbd "C-c e o") 'emms-score-show-playing)
