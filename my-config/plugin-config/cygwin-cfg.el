;;Cygwin
;;========================================================

;; 设置cygwin路径
(setenv "PATH" (concat "E:/CodeEnvironment/cygwin/bin;" (getenv "PATH")))
(setq exec-path (cons "E:/CodeEnvironment/cygwin/bin" exec-path))
(require 'cygwin-mount)
(cygwin-mount-activate)

;;使用bash代替dos
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'comint-output-filter-functions
    'shell-strip-ctrl-m nil t)
(add-hook 'comint-output-filter-functions
    'comint-watch-for-password-prompt nil t)
(setq explicit-shell-file-name "bash.exe")
;; For subprocesses invoked via the shell
;; (e.g., "shell -c command")
(setq shell-file-name explicit-shell-file-name)




;;另一个版本
;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 	;; Initial setup
;; 	;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 	;; This assumes that Cygwin is installed in C:\cygwin (the
;; 	;; default) and that C:\cygwin\bin is not already in your
;; 	;; Windows Path (it generally should not be).

;; 	(setq exec-path (cons "D:/CodeEnvironment/cygwin/bin" exec-path))
;; 	(setenv "PATH" (concat "D:/CodeEnvironment/cygwin/bin;" (getenv "PATH")))

;; 	;;   LOGNAME and USER are expected in many Emacs packages
;; 	;;   Check these environment variables.

;; 	(if (and (null (getenv "USER"))
;; 		 ;; Windows includes variable USERNAME, which is copied to
;; 		 ;; LOGNAME and USER respectively.
;; 		 (getenv "USERNAME"))
;; 	    (setenv "USER" (getenv "USERNAME")))

;; 	(if (and (getenv "LOGNAME")
;; 		 ;;  Bash shell defines only LOGNAME
;; 		 (null (getenv "USER")))
;; 	    (setenv "USER" (getenv "LOGNAME")))

;; 	(if (and (getenv "USER")
;; 		 (null (getenv "LOGNAME")))
;; 	    (setenv "LOGNAME" (getenv "USER")))

;; 	;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 	;; (A) M-x shell: This change M-x shell permanently
;; 	;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 	;; Would call Windows command interpreter. Change it.

;; 	(setq shell-file-name "bash")
;; 	(setenv "SHELL" shell-file-name)
;; 	(setq explicit-shell-file-name shell-file-name)

;; 	;; Remove C-m (^M) characters that appear in output

;; 	(add-hook 'comint-output-filter-functions
;; 	          'comint-strip-ctrl-m)

;; 	;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 	;; (B) *OR* call following function with M-x my-bash
;; 	;; The M-x shell would continue to run standard Windows shell
;; 	;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 	(defun my-bash (&optional buffer)
;; 	  "Run Cygwin Bash shell in optional BUFFER; default *shell-bash*."
;; 	  (autoload 'comint-check-proc "comint")
;; 	  (interactive
;; 	   (let ((name "*shell-bash*"))
;; 	     (if current-prefix-arg
;; 		 (setq name (read-string
;; 			     (format "Cygwin shell buffer (default %s): " name)
;; 			     (not 'initial-input)
;; 			     (not 'history)
;; 			     name)))
;; 	     (list name)))
;; 	  (or buffer
;; 	      (setq buffer "*shell-bash*"))
;; 	  (if (comint-check-proc buffer)
;; 	      (pop-to-buffer buffer)
;; 	    (let* ((shell-file-name            "bash")
;; 		   (explicit-shell-file-name   shell-file-name)
;; 		   (explicit-sh-args           '("--login" "-i"))
;; 		   (explicit-bash-args         explicit-sh-args)
;; 		   (w32-quote-process-args     ?\"));; Use Cygwin quoting rules.
;; 	      (shell buffer)
;; 	      ;;  By default Emacs sends "\r\n", but bash wants plain "\n"
;; 	      (set-buffer-process-coding-system 'undecided-dos 'undecided-unix)
;; 	      ;; With TAB completion, add slash path separator, none to filenames
;; 	      (make-local-variable 'comint-completion-addsuffix)
;; 	      (setq comint-completion-addsuffix '("/" . ""))
;; 	      ;;  This variable is local to buffer
;; 	      (setq comint-prompt-regexp "^[ \n\t]*[$] ?"))))


;;设置键绑定
(add-hook 'shell-mode-hook 'n-shell-mode-hook)
(defun n-shell-mode-hook ()
  "12Jan2002 - sailor, shell mode customizations."
  (local-set-key '[up] 'comint-previous-input)
  (local-set-key '[down] 'comint-next-input)
  (local-set-key '[(shift tab)] 'comint-next-matching-input-from-input)
  )

;;clear命令设置
(add-hook 'shell-mode-hook 'n-shell-mode-hook)

(defun n-shell-mode-hook ()
  "12Jan2002 - sailor, shell mode customizations."
  (local-set-key '[up] 'comint-previous-input)
  (local-set-key '[down] 'comint-next-input)
  (local-set-key '[(shift tab)] 'comint-next-matching-input-from-input)
  (setq comint-input-sender 'n-shell-simple-send)
  )

(defun n-shell-simple-send (proc command)
  "17Jan02 - sailor. Various commands pre-processing before sending to shell."
  (cond
   ;; Checking for clear command and execute it.
   ((string-match "^[ \t]*clear[ \t]*$" command)
    (comint-send-string proc "\n")
    (erase-buffer)
    )
   ;; Checking for man command and execute it.
   ((string-match "^[ \t]*man[ \t]*" command)
    (comint-send-string proc "\n")
    (setq command (replace-regexp-in-string "^[ \t]*man[ \t]*" "" command))
    (setq command (replace-regexp-in-string "[ \t]+$" "" command))
    ;;(message (format "command %s command" command))
    (funcall 'man command)
    )
   ;; Send other commands to the default handler.
   (t (comint-simple-send proc command))
   )
  )

;;telnet设置
(require 'telnet)

(defun telnet (host)
  "Open a network login connection to host named HOST (a string).
Communication with HOST is recorded in a buffer `*PROGRAM-HOST*'
where PROGRAM is the telnet program being used.  This program
is controlled by the contents of the global variable
`telnet-host-properties', falling back on the value of the
global variable `telnet-program'. Normally input is edited
in Emacs and sent a line at a time."
  (interactive "sOpen connection to host: ")
  (let* ((comint-delimiter-argument-list '(?\  ?\t))
         (properties (cdr (assoc host telnet-host-properties)))
         (telnet-program (if properties (car properties) telnet-program))
         (name (concat telnet-program "-" (comint-arguments host 0 nil) ))
         (buffer (get-buffer (concat "*" name "*")))
         (telnet-options (if (cdr properties)
                 (cons "-l" (cdr properties))))
         process)
    (if (and buffer (get-buffer-process buffer))
        (pop-to-buffer (concat "*" name "*"))
      (pop-to-buffer
       (apply 'make-comint name telnet-program nil telnet-options))
      (setq process (get-buffer-process (current-buffer)))
      ;;(set-process-filter process 'telnet-initial-filter)
      ;; Don't send the `open' cmd till telnet is ready for it.
      ;;(accept-process-output process)
      (erase-buffer)
      (send-string process (concat "open " host "\n"))
      (telnet-mode)
      (setq telnet-remote-echoes nil)
      (setq telnet-new-line "\n") ;; needed for cygwin 1.3.11
      (setq comint-input-sender 'telnet-simple-send)
      (setq telnet-count telnet-initial-count)
      (setq comint-process-echoes t)
      )))

;;ftp设置
(defun ftp (host)
  "03Mar01, sailor"
  "Run the ftp program using cygwin ftp."
  "Fixed the problem that the login prompt cannot be seen."
  (interactive "sFtp to Host : ")
  (let ((bufname)
        (bufobject))
    (setq bufname (concat "*ftp-" host "*"))
    (setq bufobject (get-buffer bufname))

    (cond
     ((and bufobject (get-buffer-process bufobject))
      (pop-to-buffer bufname)
      )
     (t
      (let ((login)
            (process)
            (ftp-program "ftp.exe"))
        (setq bufobject (get-buffer-create bufname))
        (pop-to-buffer bufobject)
        (comint-mode)
        (setq login (read-from-minibuffer (format "%s - Login : " host)))
        (comint-exec bufobject bufname ftp-program nil
            (list "--prompt=ftp> " "-v" host))
        (message "Login in progress. Please wait ...")
        (send-invisible (format "%s" login))
        (setq process (get-buffer-process (current-buffer)))
        (accept-process-output process)
        )
      )
     )
    )
  )

;;压缩设置
(require 'dired-aux)

(defun dired-call-process (program discard &rest arguments)
  ;; 09Feb02, sailor overwrite this function because Gnu Emacs cannot
  ;; recognize gunzip is a symbolic link to gzip. Thus, if the program
  ;; is "gunzip", replace it with "gzip" and add an option "-d".

  ;; "Run PROGRAM with output to current buffer unless DISCARD is t.
  ;; Remaining arguments are strings passed as command arguments to PROGRAM."
  ;; Look for a handler for default-directory in case it is a remote file name.
  (let ((handler
         (find-file-name-handler (directory-file-name default-directory)
                                 'dired-call-process)))
    (if handler (apply handler 'dired-call-process
                       program discard arguments)
      (progn
        (if (string-equal program "gunzip")
            (progn
              (setq program "gzip")
              (add-to-list 'arguments "-d")
              )
            )
        (apply 'call-process program nil (not discard) nil arguments)
        )
      )))