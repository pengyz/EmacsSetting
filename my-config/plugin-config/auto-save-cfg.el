;; auto save config

(auto-save-mode nil)
(setq auto-save-dir (concat temp-path "/auto-save-list"))
(check-temp-dir auto-save-dir)
(setq auto-save-list-file-prefix (concat auto-save-dir "/.saves-"))
