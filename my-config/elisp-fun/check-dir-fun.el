;; make temp directorys for some packages to restore thire data file

(defun check-temp-dir (dir-name)
  (if (not (file-exists-p dir-name))
	  (make-directory dir-name)))
