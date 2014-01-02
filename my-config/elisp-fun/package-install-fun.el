;; package install auto
;;==============================================
;; package list

(defun jpk-load-path-auto ()
  (interactive)
  (add-to-list 'load-path plugin-path)
  (dolist (f (directory-files plugin-path))
	(let ((name (concat plugin-path "/" f)))
	  (when (and (file-directory-p name) 
				 (not (equal f ".."))
				 (not (equal f ".")))
		(add-to-list 'load-path name)))))

(defun jpk-add-source()
  ;;add source for elpa
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
						   ("marmalage" . "http://marmalade-repo.org/packages/")
						   ("org" . "http://orgmode.org/elpa/")
						   ("melpa" . "http://melpa.milkbox.net/packages/"))))
;; package-install-auto
(defun jpk-package-list-install ()
  "install uninstalled packages which is in jpk-package-list value
   you can customize it manually in ~/.emacs.d/init.el"
  (interactive)
  (package-initialize)
  (when (not package-archive-contents)
	(package-refresh-contents))
  (dolist (pkg jpk-package-list)
	(when (and (not (package-installed-p pkg))
			   (assoc pkg package-archive-contents))
	  (package-install pkg))))

;; list the unaccounted packages
(defun package-list-unaccounted-packages ()
  "Like `package-list-packages', but shows only the packages that
  are installed and are not in `jpk-packages'.  Useful for
  cleaning out unwanted packages."
  (interactive)
  (package-show-package-list
   (remove-if-not (lambda (x) (and (not (memq x jpk-package-list))
								   (not (package-built-in-p x))
								   (package-installed-p x)))
                  (mapcar 'car package-archive-contents))))



