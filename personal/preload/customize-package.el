;;=========================================
;; customize package to install 
;;=========================================

(load-file (expand-file-name "package-install-fun.el" (concat user-emacs-directory "personal/preload/per-funs")))
(setq jpk-package-list
      '(

        ;;=========================================IN USED PKG ====================================================
        auto-complete          ;; an auto complete system can combine with yasnippet and other resourses
        tabbar                 ;; tab pages just like a typical windows style
        yasnippet              ;; yet another snippets --snippet complete system
        ascope                 ;; another cscope additional
        cygwin-mount           ;; an config file for cygwin to mount in windows
        ctypes                 ;; a foced font lock for C/C++
        ecb                    ;; emacs code browser
        expand-region          ;; C-= select region
        tabbar-ruler           ;; tabbar and global ruler
        smex                   ;; M-x complete
        paredit                ;; paren force mode for scheme and other lisp languages
        smartparens            ;; paren auto complete
        dash                   ;; dependcy for smartparens
        browse-kill-ring       ;; browse kill ring and do some option in it
        make-project           ;; not in use
        popup                  ;; dependcy for yasnippet
        header2                ;; insert header info for your file
        session                ;; save edit conditions
        emms                   ;; a mutiple system to use mplayer vlc etc in emacs (It doesn't work now in windows!)
        vlf                    ;; view large file
        lua-mode               ;; lua support
        rect-mark              ;; real retangle mark and edit
        pos-tip                ;; dependcy package for yasnippet provide a tips display
        auto-complete-clang    ;; auto-complete sources for C/C++
        bind-key;;(todo)		       ;; a simple way to manage personal key bindings
        undo-tree;;(todo)              ;; extension of emacs base undo system,just organize undo history as a tree
        ;;========================================================================================================



        ;;=========================================NOT IN USE ====================================================
        ;; emacs-setup            ;; help to setup emacs and customize variables
        ;; slime                  ;; common-lisp support
        ;; git                    ;; git support
        ;; f                      ;; dependcy for git
        ;; s                      ;; dependcy for git 
        ;;========================================================================================================

        ))
;; add elpa source
(jpk-add-source)
;; add hook 
(add-hook 'after-init-hook 'jpk-package-list-install)
