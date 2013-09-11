;;;; Font And Coding Settings start here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;字体大小
(set-default-font "11")
;;不要生成临时文件
(setq-default make-backup-files nil)
;;设置中文语言环境
;;(set-language-environment 'Chinese-GB)
;;写文件的编码方式
;;(set-buffer-file-coding-system 'gb2312)
;;(set-buffer-file-coding-system 'utf-8)
;;新建文件的编码方式
;;(setq default-buffer-file-coding-system 'gb2312)
;;(setq default-buffer-file-coding-system 'utf-8)
 ;;终端方式的编码方式
;;(set-terminal-coding-system 'utf-8)
 ;;键盘输入的编码方式
;;(set-keyboard-coding-system 'gb2312)

;;优先使用utf-8编码
(prefer-coding-system 'utf-8)
 ;;读取或写入文件名的编码方式
(if (eq system-type 'windows-nt)
    (setq file-name-coding-system 'gbk))
;;text 模式
;;(default-major-mode 'text-mode)

;;;; Font And Coding Settings end here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
