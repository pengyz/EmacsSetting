;;;; functions to setup platform dependent settings. 
(defvar shellpath nil                                                 
"Path of which shell will be used by emacs.")           
(defun shell-settings ()                                      
;;; Shell                                                                    
(if (eq system-type 'windows-nt)                             
(setq shellpath "D:\Cygwin\bin\mintty.exe")                    
(setq shellpath "/bin/bash"))                                   
(setq shell-file-name shellpath)                               
(setq-default explicit-shell-file-name shellpath)       
(setenv "SHELL" shell-file-name))                   

;;(shell-settings)
