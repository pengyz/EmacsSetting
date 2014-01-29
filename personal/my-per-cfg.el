
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set default directory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq default-directory "F:/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set Emacs C Source Code Directory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq source-directory "F:/Sources/emacs/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set title format
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq frame-title-format "%b@pengyz-Emacs24.3")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; disable whitespace-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq prelude-whitespace nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; scroll-bar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(scroll-bar-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Define my kbd prefix to use C-z
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color-theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(disable-theme 'zenburn)
(load-theme 'manoj-dark t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; temp symbol for jmp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-z t") 'ska-point-to-register)
(global-set-key (kbd "C-z g") 'ska-jump-to-register)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; eval-buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-z e") 
                (lambda()
                  (interactive)
                  (eval-buffer)
                  (message "eval-buffer over")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-z d ��ʽ����ǰbuffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-z d") 'indent-whole)


(add-hook 'after-init-hook 'my-maximize-frame)

;;C-z p �г�δ���б��е��Ѱ�װ��
;; (global-set-key (kbd "C-z p") 'package-list-unaccounted-packages)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; font size 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; For Linux
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
;; For Windows
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; wy-go-to-char
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-z f") 'wy-go-to-char)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; % for praen match
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key "%" 'match-paren)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; home end for whole document
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-z z suspend-frame
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-z z") 'suspend-frame)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use my-coment-dwin-line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "M-;") 'my-comment-dwim-line) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; window change
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<down>") 'windmove-down)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;kbd change default
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;C-w���ɾ��һ����
(global-set-key (kbd "C-w") 'backward-kill-word)
;;Ctrl-x Ctrl-b ibuffer 
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;C-z C-z ����
(global-set-key (kbd "C-z C-z") 'undo)
;;C-z space���ñ��
(global-set-key (kbd "C-z <SPC>") 'set-mark-command)
;;unbind key mouse-2
(global-unset-key (kbd "<mouse-2>"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; close buffer and window
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "<f3>") (lambda ()
                               (interactive)
                               (kill-buffer)
                               (delete-window)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; close this buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-<f3>") 'kill-this-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; delete this window
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "M-<f3>") 'delete-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; speedbar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "<f4>") 'speedbar)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;refresh buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "<f5>") 'refresh-file)
;; (global-set-key (kbd "<f5>") 'shell)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; open shell other window
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-<f5>") (lambda()
                                 (interactive)
                                 (split-window-below)
                                 (other-window-for-scrolling)
                                 (shell)))
;;F6 : org-publish
;; (global-set-key (kbd "<f6>") 'org-publish)
;;C-F6 suppend-frame
;; (global-set-key (kbd "C-<f6>") 'suspend-frame)
;;F17����ӵ�ǰҳ����ǩ��
(global-set-key (kbd "<f7>") 'bookmark-set)
;;C-F7���о��ҵ���ǩ
(global-set-key (kbd "C-<f7>") 'list-bookmarks)

;;;;KeyBinding-Setting end   here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;Package-Settings start here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; enable smartparens
(require 'smartparens)
(smartparens-global-mode t)

;;enable smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)

;;enable ido
(require 'ido)
(ido-mode t)


;;���OD�Ŀ�ݼ�
;;========================================================
;; dwin to add block 
(global-set-key (kbd "C-z C-b") 'my-dwin-add-star-block)
;; get call addr
(global-set-key (kbd "C-z C-a") (lambda()
                                  (interactive)
                                  (my-get-addr-of-OD-line "call")))
;; get base addr
(global-set-key (kbd "C-z C-s") (lambda()
                                  (interactive)
                                  (my-get-addr-of-OD-line "\\[")))

;;�б༭
;;========================================================
(require 'rect-mark)
;;�б༭����
;;========================================================
(global-set-key (kbd "C-z C-x") 'my-dwin-kill-region)
(global-set-key (kbd "C-z C-c") 'my-dwin-kill-ring-save)
(global-set-key (kbd "C-z C-d") 'my-dwin-delete-region)

(global-set-key (kbd "C-z c") 'rm-kill-ring-save)
(global-set-key (kbd "C-z C-y") 'yank-rectangle)
(global-set-key (kbd "C-z i") 'string-insert-rectangle)
(global-set-key (kbd "C-z C-i") 'string-rectangle)
(global-set-key (kbd "C-z m") 'rm-set-mark)

(global-set-key (kbd "C-<down-mouse-1>") 'rm-mouse-drag-region)

;; org mode
;;========================================================
(add-hook 'org-mode-hook (lambda () 
                           (setq truncate-lines nil)))
;;Ĭ�Ͽ���indentģʽ
(setq org-startup-indented t)
;;����tudo item��¼
(setq org-log-done 'time)
(setq org-log-done 'note)

;; server-mode
;;========================================================
(require 'server)
;;����� server-auth-dir��ֵ�Ķ��Ժ�emacs�޷���ʵ������
(check-temp-dir server-auth-dir)
(when (and (= emacs-major-version 24)
           (= emacs-minor-version 3)
           (equal window-system 'w32))
  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
                                        ; ~/.emacs.d/server is unsafe"
                                        ; on windows.
(server-start)

;; linum-mode
;;===============================================
(global-linum-mode t)


;; disable global-hl-line-mode
;;===============================================
(global-hl-line-mode -1)


;;========================================================
;;����Session
;;========================================================
;; (require 'session)
;; (add-hook 'after-init-hook session-initialize)

;;========================================================
;;����desktop
;;========================================================
(require 'desktop)
(setq desktop-dir prelude-savefile-dir)
(setq desktop-path (list desktop-dir))
(setq desktop-dirname desktop-dir)
(setq desktop-base-file-name ".desktop")
(setq desktop-save t)
;;�����Զ�����
(desktop-save-mode t)

;;========================================================
;;tabbarSettings
;;========================================================
;;tabbar-ruler
(setq tabbar-ruler-global-tabbar 't) ; If you want tabbar
(setq tabbar-ruler-global-ruler 't) ; if you want a global ruler
;;=====not use==========
(setq tabbar-ruler-popup-menu 'nil) ; If you want a popup menu.
(setq tabbar-ruler-popup-toolbar 'nil) ; If you want a popup toolbar
(setq tabbar-ruler-popup-scrollbar 'nil) ; If you want to only show the
                                        ; scroll bar when your mouse is moving.

(require 'tabbar-ruler)

(global-set-key (kbd "C-z C-t") 'tabbar-ruler-move)




;;==================================================================
;; Scheme  settings
;;==================================================================
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)
(wttr/prepend-to-exec-path "F:/CodeEnvironment/Racket")
(require 'cmuscheme)
(setq scheme-program-name "racket")         ;; ����� Petite �͸ĳ� "petite"
;;����includeĿ¼
(setq semantic-default-scheme-path '("/usr/share/guile/" "F:/CodeEnvironment/Racket/include"))
;;scheme mode hook
(add-hook 'scheme-mode-hook
          (lambda ()
            (paredit-mode 1)
            (define-key scheme-mode-map (kbd "<f5>") 'scheme-send-last-sexp-split-window)
            (define-key scheme-mode-map (kbd "<f6>") 'scheme-send-definition-split-window)))

;;==================================================================
;;g++ settings
;;==================================================================
(wttr/prepend-to-exec-path "F:/CodeEnvironment/GCC/gcc/bin")

;;========================================================
;; Yasnippet and Auto-complete settings
;;========================================================

(require 'yasnippet)
(yas-global-mode 1)
(require 'auto-complete)
(require 'auto-complete-config)		
;;ʹ����ǿ�б�
(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip)
;;����Ĭ��ac����
(ac-config-default)
(auto-complete-mode 1)
;;���backspac�����б�
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))
;;ʹ�ð���ģʽ
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)
;;����ac-dwin
(setq ac-dwim t)
;;����ac�����ļ�λ��
(setq ac-comphist-file (expand-file-name "ac-comphist/ac-comphist.dat" prelude-savefile-dir))
(check-temp-dir (expand-file-name "ac-comphist/" prelude-savefile-dir))
;;���ac��ȫԴ
(set-default 'ac-sources
             '(ac-source-semantic ;;acʹ��semantic�ķ������
               ac-source-yasnippet
               ac-source-abbrev
               ac-source-words-in-buffer
               ac-source-words-in-all-buffer
               ac-source-imenu
               ac-source-files-in-current-dir
               ac-source-filename))

;;yas-ac����
(defface ac-yasnippet-candidate-face
  '((t (:background "sandybrown" :foreground "black")))
  "Face for yasnippet candidate.")

(defface ac-yasnippet-selection-face
  '((t (:background "coral3" :foreground "white")))
  "Face for the yasnippet selected candidate.")

(defvar ac-source-yasnippet
  '((candidates . ac-yasnippet-candidate)
    (action . yas/expand)
    (candidate-face . ac-yasnippet-candidate-face)
    (selection-face . ac-yasnippet-selection-face))
  "Source for Yasnippet.")

;; auto-complete-clang
;; (defcustom mycustom-system-include-paths '("./include/" "/opt/local/include" "/usr/include" )
;;   "This is a list of include paths that are used by the clang auto completion."
;;   :group 'mycustom
;;   :type '(repeat directory)
;;   )

;; (add-to-list 'load-path "~/bin/emacs/auto-complete")
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/bin/emacs/auto-complete/ac-dict")
;; (ac-config-default)


;; (defun my-ac-clang-mode-common-hook()
;;   (require 'auto-complete-clang)
;;   (setq clang-completion-suppress-error 't)
;;   (setq ac-clang-flags
;;         (mapcar (lambda (item)(concat "-I" item))
;;                 (append
;;                  ;; mycustom-system-include-paths
;;                  semantic-c-dependency-system-include-path
;;                  )))
;;   (define-key c-mode-base-map (kbd "M-/") 'ac-complete-clang))

;; (add-hook 'c-mode-common-hook 'my-ac-clang-mode-common-hook)


;;========================================================
;;ECB����
;;========================================================
(require 'ecb-autoloads)
;;�ر�ÿ����ʾ
(setq ecb-tip-of-the-day nil
      ecb-tree-indent   4
      ecb-windowns-height 0.5
      ecb-windowns-width 0.20
      ecb-auto-compatiblity-check nil
      ecb-version-check nil)

;; �ر�ecb��directories-make-buckets
(setq ecb-history-make-buckets 'never)
;; ����ede��Ŀ�����ļ�·��
(setq ede-project-placeholder-cache-file (expand-file-name "ede-projects/ede-projects.el" prelude-savefile-dir))

(check-temp-dir (expand-file-name "ede-projects/" prelude-savefile-dir))
;; ����ecb�û��Զ���ģ���ļ�·��
(setq ecb-create-layout-file (expand-file-name "ecb-layout/.ecb-user-layouts.el" prelude-savefile-dir))
(check-temp-dir (expand-file-name "ecb-layout/" prelude-savefile-dir))
;; ����ecb���ģʽ
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))

;; C-z C-e : ����-�ر�ecb
(setq ecb-minor-mode nil)
(global-set-key (kbd "C-z C-e") (lambda ()
                                  (interactive)
                                  (if ecb-minor-mode
                                      (ecb-deactivate)
                                    (ecb-activate))))
;;========================================================
;; cedet settings
;;========================================================

(require 'cedet)
;;semantic-mode ����

;;����������ժҪ��ʾ
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
;;����semantic��ȫ
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
;;���������»��߱�ʶ
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode t)
;;����semantic��ǩģʽ
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode t)
;;����unmatch syntax��ʶ
;; (add-to-list 'semantic-default-submodes 'global-semantic-show-unmatched-syntax-mode 1)
;;������ǰ��������
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode 1)
;;�������з���
(add-to-list 'semantic-default-submodes 'semantic-idle-scheduler-mode 3)
;;������ǰ�༭����
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-edits-mode (if window-system 1 -1))
;;������ǰ����״̬��ʾ
(add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode 1)
;;�������Ųο�����
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode 1)
;;�������м��ʾ
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-breadcrumbs-mode 1)

;; ����semantic
(semantic-mode t)

;; ����semanticռ��CPU����
(setq-default semantic-idle-scheduler-idle-time 432000)

;;����VC++ϵͳͷ�ļ�·��
(setq semantic-c-dependency-system-include-path (quote ("/usr/include" "C:/Program Files/Microsoft SDKs/Windows/v7.1A/Include" "C:/Program Files/Microsoft Visual Studio 11.0/VC/atlmfc/include" "C:/Program Files/Microsoft Visual Studio 11.0/VC/include")))

;;semantic-ia����
(require 'semantic/ia)
(setq-mode-local c-mode semanticdb-find-default-throttle '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle '(project unloaded system recursive))

;;TAGS Menu
(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

;; ʹ�� gnu global ��TAGS��
;;========================================================
;; (require 'semantic/db-global)
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)


;;�������߲���
;;; hippie-try-expand settings
(setq hippie-expand-try-functions-list
      '(
        yas/hippie-try-expand
        semantic-ia-complete-symbol
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs))

(defun indent-or-complete ()
  "Complete if point is at end of a word, otherwise indent line."
  (interactive)
  (if (looking-at "\\>")
      (hippie-expand nil)
    (indent-for-tab-command)
    ))

(defun yyc/indent-key-setup ()
  "Set tab as key for indent-or-complete"
  (local-set-key  (kbd "<tab>") 'indent-or-complete))

;;�ṹ�岹ȫ
(defun yyc/c-mode-keys ()
  "description"
  ;; Semantic functions.
  (semantic-default-c-setup)
  (local-set-key (kbd "C-c ?") 'semantic-ia-complete-symbol-menu)
  (local-set-key (kbd "C-c b") 'semantic-mrub-switch-tags)
  (local-set-key (kbd "C-c R") 'semantic-symref)
  (local-set-key (kbd "C-c j") 'semantic-ia-fast-jump)
  (local-set-key (kbd "C-c p") 'semantic-ia-show-summary)
  (local-set-key (kbd "C-c l") 'semantic-ia-show-doc)
  (local-set-key (kbd "C-c r") 'semantic-symref-symbol)
  (local-set-key (kbd "C-c /") 'semantic-ia-complete-symbol)
  (local-set-key (kbd "C-<return>") 'semantic-ia-complete-symbol)
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert)
  ;; Indent or complete
  (local-set-key  (kbd "<tab>") 'indent-or-complete)
  )
(add-hook 'c-mode-common-hook 'yyc/c-mode-keys)

;; ����EDE���ڹ��̹���
(global-ede-mode 1)

;;����WDK��include·��(ò��û��ʲô����)
;; (my-semantic-inc-dir t)
;;����semantic���ݿ�洢λ��
;; (setq semantic-db-dir (concat temp-path "/semanticDB"))
;; (check-temp-dir semantic-db-dir)
;; (setq semanticdb-default-save-directory (expand-file-name semantic-db-dir))


;; ����Semantic�ļ�����Χ:
;; (setq semanticdb-project-roots 
;; 	  (list
;; 	   (expand-file-name "F:/")))
;; ����semantic�Ŀ��ļ����ݿ�
(my-semantic-use-system-database)
;; (mapc ((lambda (dir) 
;;          (semanticdb-create-ebrowse-database dir))))
;; (semantic-c-dependency-system-include-path)
;; ����speedbarʹ��semantic/db
(add-hook 'speedbar-load-hook (lambda () 
                                (require 'semantic/sb)))


;;��ݼ�����
;;========================================================
;;F12 ת������
(define-key semantic-mode-map (kbd "<f11>") 'semantic-ia-fast-jump)
;;M-Mouse1 ת������
(define-key semantic-mode-map (kbd "M-<down-mouse-1>") 'semantic-ia-fast-mouse-jump)
;;push-mark bug fix
(defadvice push-mark (around semantic-mru-bookmark activate)
  "Push a mark at LOCATION with NOMSG and ACTIVATE passed to `push-mark'.
If `semantic-mru-bookmark-mode' is active, also push a tag onto
the mru bookmark stack."
  (semantic-mrub-push semantic-mru-bookmark-ring
                      (point)
                      'mark)
  ad-do-it)

;;semantic-ia-jmp-back
(define-key semantic-mode-map (kbd "S-<f11>")
  (lambda ()
    (interactive)
    (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
        (error "Semantic Bookmark ring is currently empty"))
    (let* ((ring (oref semantic-mru-bookmark-ring ring))
           (alist (semantic-mrub-ring-to-assoc-list ring))
           (first (cdr (car alist))))
      (if (semantic-equivalent-tag-p (oref first tag)
                                     (semantic-current-tag))
          (setq first (cdr (car (cdr alist)))))
      (semantic-mrub-switch-tags first))))
;;semantic-ia-jmp-or-back
(define-key semantic-mode-map (kbd "C-<f11>")
  (lambda (&optional back)
    (interactive "P")
    (if back
        (semantic-ia-fast-jump-back)
      (semantic-ia-fast-jump (point)))))



;; browse kill ring
;;========================================================
(global-set-key (kbd "C-z C-r") 'browse-kill-ring)

;;;;Package-Settings end here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
