;; OD helper functions
;; ==============================================================================

;; 准备写出my-dwin-add-block的高阶函数，结果失败了，对于字符处理的过程不太清楚
;; (defun my-symbol-block-p(symbol)
;;   "return t if current line is blocked with symbol "
;;   (interactive)
;;   (save-excursion
;;     (let ((first-match nil)
;;           (last-match nil))
;;       (beginning-of-line)
;;       (setq first-match (looking-at (concat "^[ ]*" symbol ".*$")))
;;       (end-of-line)
;;       (setq last-match (looking-back (concat symbol "$")))
;;       (and first-match last-match))))

;; (defun my-dwin-add-symbol-block (symbol)
;;   "dwin to add star block"
;;   (interactive)
;;   (let ((beg nil)
;;         (end nil)
;;         (origional (point)))
;;     (end-of-line)
;;     (setq end (point))
;;     (beginning-of-line)
;;     (back-to-indentation)
;;     (setq beg (point))
;;     ;; add  org title level
;;     (if (and  (eq symbol "\*")(looking-at "^\** ") (eq major-mode 'org-mode))
;;         (progn
;;           (insert "*")
;;           (goto-char origional))
;;       ;; toggle star block
;;       (if (not (my-symbol-block-p symbol))
;;           ;; add block if not
;;           (progn
;;             (beginning-of-line)
;;             (back-to-indentation)
;;             (insert symbol)
;;             (end-of-line)
;;             (insert symbol)
;;             (if (re-search-forward (concat "^" symbol symbol "$"))
;;                 (progn 
;;                   (goto-char origional)
;;                   (forward-char 1))))
;;         ;; delete * if blocked
;;         (progn
;;           (setq origional (- origional 1))
;;           (beginning-of-line)
;;           (back-to-indentation)
;;           (delete-char 1)
;;           (end-of-line)
;;           (delete-char -1)
;;           (goto-char origional))))))
;; (setq symbol "\[")

;; (global-set-key (kbd "C-z e") (lambda()
;;                 (interactive)
;;                 (my-dwin-add-symbol-block "\!")))

;; my-star-block-p
(defun my-star-block-p()
  "return t if current line is blocked with '*' "
  (interactive)
  (save-excursion
    (let ((first-match nil)
          (last-match nil))
      (beginning-of-line)
      (setq first-match (looking-at "^[ ]*\*.*$"))
      (end-of-line)
      (setq last-match (looking-back "\*$"))
      (and first-match last-match))))


;; dwin版本的add-star-block
(defun my-dwin-add-star-block ()
  "dwin to add star block"
  (interactive)
  (let ((beg nil)
        (end nil)
        (origional (point)))
    (end-of-line)
    (setq end (point))
    (beginning-of-line)
    (back-to-indentation)
    (setq beg (point))
    ;; add  org title level
    (if (and (looking-at "^\** ") (eq major-mode 'org-mode))
        (progn
          (insert "*")
          (goto-char origional))
      ;; toggle star block
      (if (not (my-star-block-p))
          ;; add block if not
          (progn
            (beginning-of-line)
            (back-to-indentation)
            (insert "*")
            (end-of-line)
            (insert "*")
            (if (re-search-forward "^\*\*$")
                (progn 
                  (goto-char origional)
                  (forward-char 1))))
        ;; delete * if blocked
        (progn
          (setq origional (- origional 1))
          (beginning-of-line)
          (back-to-indentation)
          (delete-char 1)
          (end-of-line)
          (delete-char -1)
          (goto-char origional))))))

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
            (message "address %s copied !" (car kill-ring-yank-pointer)))
        (error "regexp '%s' not match !" search-text)))))
