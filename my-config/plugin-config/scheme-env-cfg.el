;;ParEdit settings
;;==================================================================
;; (add-to-list 'load-path (concat plugin-path "/paredit"))

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)



;; Scheme  settings
;;==================================================================
(wttr/prepend-to-exec-path "F:/CodeEnvironment/Racket")
(require 'cmuscheme)
(setq scheme-program-name "racket")         ;; 如果用 Petite 就改成 "petite"
;;设置include目录
(setq semantic-default-scheme-path '("/usr/share/guile/" "F:/CodeEnvironment/Racket/include"))


;;mode hook
(add-hook 'scheme-mode-hook
		  (lambda ()
			(paredit-mode 1)
			(define-key scheme-mode-map (kbd "<f5>") 'scheme-send-last-sexp-split-window)
			(define-key scheme-mode-map (kbd "<f6>") 'scheme-send-definition-split-window)))
