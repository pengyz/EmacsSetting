;; ctype config
;;===========================================================
(defun my-c-mode-hook ()
  (require 'ctypes)
  (turn-on-font-lock))
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)

;; (defun my-ctypes-load-hook ()
;;   (ctypes-read-file "~/.ctypes_std_c" nil t t))
;; (add-hook 'ctypes-load-hook 'my-ctypes-load-hook)
