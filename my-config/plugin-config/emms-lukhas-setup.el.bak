;; ;; This is -*- emacs-lisp -*-
;; ;; -------------------------------------------------------------------------- ;;
;; ;;   EMMS configuration script                                                ;;
;; ;; .......................................................................... ;;
;; ;;   Author:             Lucas Bonnet                                         ;;
;; ;;   Sources:            EmacsWiki, #emacs, emms-help@gnu.org                 ;;
;; ;; -------------------------------------------------------------------------- ;;

;; (require 'emms-setup)

;; (emms-devel)

;; (setq emms-mode-line-titlebar-function 'emms-mode-line-playlist-current)

;; (add-hook 'emms-player-started-hook 'my-emms-current)

;; (setq emms-player-mpg321-parameters '("-o" "alsa"))

;; (setq emms-show-format "NP: %s")

;; (defun emms-google-for-lyrics ()
;;   (interactive)
;;   (browse-url
;;    (concat "http://www.google.com/search?q="
;;            (replace-regexp-in-string " +" "+"
;;                                      (concat "lyrics "
;;                                              (delete ?- (emms-track-description
;; 														 (emms-playlist-current-selected-track))))))))

;; ;; play what i mean
;; (defun emms-pwim (truc &optional rien)
;;   "Plays the TRUC specified, whatever it is. The function tries to
;; guess the type of TRUC, between playlist, directory containing
;; playable tracks, and files. If the directory does not contain
;; playable tracks, but some sub-directories, it will play the
;; tree."
;;   (interactive
;;    (find-file-read-args "Play what ? " t))
;;   (cond
;;    ((file-exists-p truc)    (emms-play-file truc))
;;    ((file-directory-p truc) (emms-play-directory truc)))
;;   )

;; ;; add what i mean
;; (defun emms-awim (truc &optional rien)
;;   "Adds the TRUC specified, whatever it is. The function tries to
;; guess the type of TRUC, between playlist, directory containing
;; playable tracks, and files. If the directory does not contain
;; playable tracks, but some sub-directories, it will add the
;; tree."
;;   (interactive
;;    (find-file-read-args "Add what ? " t))
;;   (cond
;;    ((file-exists-p truc)    (emms-add-file truc))
;;    ((file-directory-p truc) (emms-add-directory truc)))

;;   ;; test playlist
;;   )

;; (defun emms-osd-message (string)
;;   (shell-command-to-string 
;;    (concat "osdctl" " -s " "\"" string "\"" ","))
;;   nil)

;; (defun my-emms-current ()
;;   (interactive)
;;   (emms-track-description (emms-playlist-current-selected-track)))

;; (defun emms-osd-np ()
;;   (interactive)
;;   (emms-osd-message (my-emms-current))
;;   nil)

;; (add-hook 'emms-player-started-hook 'emms-osd-np)


;; (setq emms-stream-info-format-string "NS: %s"
;;       emms-stream-default-action "play"
;;       emms-stream-popup-default-height 120)

;; (define-emms-simple-player spc '(file) (regexp-opt '(".spc" ".SPC")) "ospc" "-l" "-t " "3:00")

;; (setq emms-player-list
;;       '(
;;         emms-player-spc
;;         emms-player-mplayer-playlist
;;         emms-player-mplayer
;;         emms-player-gstreamer))

;; (setq emms-player-mplayer-parameters (list "-slave" "-nortc" "-quiet" "-really-quiet"))

;; ;; Icon setup.
;; (setq emms-mode-line-icon-before-format "["
;;       emms-mode-line-format " %s]"
;;       emms-mode-line-icon-color "lightgrey")

;; (require 'emms-mode-line-icon)

;; (defun circe-command-NP (arg)
;;   "test."
;;   (lui-replace-input (emms-show)))

;; (setq emms-lyric-display-p nil)

;; (defun emms-mode-line-icon-function ()
;;   (concat " "
;;           emms-mode-line-icon-before-format
;;           (propertize "NP:" 'display emms-mode-line-icon-image-cache)
;;           (format emms-mode-line-format (emms-track-get 
;;                                          (emms-playlist-current-selected-track)
;;                                          'info-title))))

;; (setq emms-playlist-buffer-name "*EMMS Playlist*"
;;       emms-playlist-mode-open-playlists t)

;; ;; Libtag support
;; (require 'emms-info-libtag)
;; (setq emms-info-functions '(emms-info-libtag))

;; ;; Stolen and adapted from TWB
;; (defun my-emms-info-track-description (track)
;;   "Return a description of the current track."
;;   (if (and (emms-track-get track 'info-artist)
;;            (emms-track-get track 'info-title))
;;       (let ((pmin (emms-track-get track 'info-playing-time-min))
;;             (psec (emms-track-get track 'info-playing-time-sec))
;;             (ptot (emms-track-get track 'info-playing-time))
;;             (art  (emms-track-get track 'info-artist))
;;             (tit  (emms-track-get track 'info-title)))
;;         (cond ((and pmin psec) (format "%s - %s [%02d:%02d]" art tit pmin psec))
;;               (ptot (format  "%s - %s [%02d:%02d]" art tit (/ ptot 60) (% ptot 60)))
;;               (t (emms-track-simple-description track))))))

;; (setq emms-track-description-function 'my-emms-info-track-description)

;; ;; caching stuff
;; (setq later-do-interval 0.001
;;       emms-info-asynchronously nil)


;; (if (equal system-type 'windows-nt)                       
;; 	(add-to-list 'exec-path  "C:/Program Files/MPlayer/"))

;; (setq emms-source-file-default-directory "D:/歌曲/")

;; (global-set-key (kbd "C-z w")    'emms-google-for-lyrics)
;; (global-set-key (kbd "C-z s")    'emms-smart-browse)
;; (global-set-key (kbd "C-z l")    'emms-playlist-mode-go)
;; (global-set-key (kbd "C-z r")  'emms-stream-popup)
;; (global-set-key (kbd "C-z <right>") 'emms-next)
;; (global-set-key (kbd "C-z <left>") 'emms-previous)



;; (provide 'emms-lukhas-setup)

;;========================================================================
;; emms

(require 'emms-setup)
(require 'emms-info-libtag)
(require 'emms-player-mpg321-remote)
(emms-devel)
(emms-default-players)
(push 'emms-player-mpg321-remote emms-player-list)
(push 'emms-player-mplayer emms-player-list)
(push 'emms-player-mplayer-playlist emms-player-list)

(setq
 emms-info-asynchronously t
 later-do-interval 0.0001
 emms-info-functions '(emms-info-libtag)
 emms-source-file-default-directory "D:/歌曲/"
 emms-mode-line-format " %s "
 emms-show-format "NP: %s")

(if (equal system-type 'windows-nt)                       
	(add-to-list 'exec-path  "C:/Program Files/MPlayer/"))

(global-set-key (kbd "<kp-subtract>") 'emms-previous)
(global-set-key (kbd "<kp-add>") 'emms-next)
(global-set-key (kbd "<insert>") 'de-add-dir)
(global-set-key (kbd "<kp-insert>") 'de-toggle-playing)
(global-set-key (kbd "<f2>") 'emms-smart-browse)
(global-set-key (kbd "<kp-right>") 'emms-seek-forward)
(global-set-key (kbd "<kp-left>") 'emms-seek-backward)

(define-key emms-playlist-mode-map (kbd "/") 'de-search)
(define-key emms-browser-mode-map (kbd "W W") 'emms-browser-lookup-multi)

(add-hook 'emms-playlist-selection-changed-hook 'de-focus-on-track)
(add-hook 'emms-player-started-hook 'emms-show)

;; set up a default cover
(setq emms-browser-default-covers
      (list "/home/resolve/misc/cover_small.jpg" nil nil))

;; let compilation tracks be displayed together
(setq emms-browser-get-track-field-function
      'emms-browser-get-track-field-use-directory-name)

;; filters
(emms-browser-make-filter "2005" (emms-browser-filter-only-dir "~/Mp3s/2005"))
(emms-browser-make-filter "2000-2004" (emms-browser-filter-only-dir "~/Mp3s/2000-2004"))
(emms-browser-make-filter "90s" (emms-browser-filter-only-dir "~/Mp3s/90s"))
(emms-browser-make-filter "80s" (emms-browser-filter-only-dir "~/Mp3s/80s"))
(emms-browser-make-filter "70s" (emms-browser-filter-only-dir "~/Mp3s/70s"))
(emms-browser-make-filter "classical" (emms-browser-filter-only-dir "~/Mp3s/classical"))
(emms-browser-make-filter "mp3s" (emms-browser-filter-only-dir "~/Media/mp3s"))
(emms-browser-make-filter "pending" (emms-browser-filter-only-dir "~/Media/pending"))
(emms-browser-make-filter "not-played"
						  (lambda (track) (not (funcall (emms-browser-filter-only-recent 365) track))))
(emms-browser-make-filter "last-3months" (emms-browser-filter-only-recent 90))
(emms-browser-make-filter "last-month" (emms-browser-filter-only-recent 30))
(emms-browser-make-filter "last-week" (emms-browser-filter-only-recent 7))
(emms-browser-make-filter
 "all"
 (lambda (track)
   (or
    (funcall (emms-browser-filter-only-type 'file) track)
    ;; ignore the pending directory
    (not (funcall
          (emms-browser-filter-only-dir "~/Media/pending") track)))))

(emms-browser-set-filter (assoc "all" emms-browser-filters))

(add-hook 'emms-browser-filter-changed-hook 'de-filter-changed)
(defun de-filter-changed ()
  (interactive)
  (if (string= emms-browser-current-filter-name "pending")
      (setq emms-browser-get-track-field-function
            'emms-browser-get-track-field-simple)
    (setq emms-browser-get-track-field-function
          'emms-browser-get-track-field-use-directory-name)))

;; recenter based on the current track
(defun de-focus-on-track ()
  (let ((w (get-buffer-window emms-playlist-buffer t)))
    (when w
      (with-selected-window w
        (emms-playlist-mode-center-current)
        (recenter '(4))))))

(defun de-toggle-playing ()
  (interactive)
  (if emms-player-playing-p
      (emms-pause)
    (emms-start)))

(defun de-add-dir ()
  (interactive)
  (call-interactively 'emms-add-directory-tree)
  (emms-playlist-mode-go))

(defun de-search ()
  (interactive)
  (goto-char (point-min))
  (call-interactively 'isearch-forward))

(defun emms-browser-lookup-multi ()
  (interactive)
  (emms-browser-lookup-wikipedia 'info-artist)
  (emms-browser-lookup-wikipedia 'info-album)
  (emms-browser-lookup-pitchfork 'info-artist))

;; for lukhas - remove album display in a filter
(defadvice emms-browser-next-mapping-type (after no-album (current-mapping))
  (when (eq ad-return-value 'info-album)
    (setq ad-return-value 'info-title)))
(defun toggle-album-display ()
  (if (string= emms-browser-current-filter-name "80s")
      (ad-activate 'emms-browser-next-mapping-type)
    (ad-deactivate 'emms-browser-next-mapping-type)))
(add-hook 'emms-browser-filter-changed-hook 'toggle-album-display)
