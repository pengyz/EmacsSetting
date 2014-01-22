;; OD helper functions
;; ==============================================================================

;; dwin版本的add-star-block
(defun my-dwin-add-star-block ()
  "dwin to add star block"
  (interactive)
  (let ((beg nil)
        (end nil))
    (end-of-line)
    (setq end (point))
    (prelude-move-beginning-of-line 1)
    (setq beg (point))
    (if (and (looking-at "^*") (eq major-mode 'org-mode))
        (insert "*")
      (add-star-block))))

;; 复制地址值到剪切板
(defun my-get-addr-of-OD-line (search-text)
  "get address on current line"
  (interactive "MRegepx for address search:")
  (save-excursion
    (let ((end nil)
          (match nil))
      (end-of-line)
      (setq end (point))
      (prelude-move-beginning-of-line 1)
      (setq match (re-search-forward (concat search-text ".*[0-9A-F]\\{8\\}") end t))
      (if match
          (progn
            (kill-ring-save (- (point) 8) (point))
            (message "Address (Value:%s) Copied !" (car kill-ring-yank-pointer)))
        (error "regexp %s  not match !" (concat search-text ".*[0-9A-F]\\{8\\}"))))))
