;;;;Color-Settings start here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Emacs24内置了color-theme，以前那种外部引入的写法现在报错
;;这种内建color-theme其实也还可以，就是选择有点少，不过好像能自己添加color-theme
;;提供几种颜色的备选方案（好像都差不多，我喜欢暗色调的theme）

(add-to-list 'custom-theme-load-path "~/.emacs.d/plugins/emacs-color-theme")
;;(load-theme 'solarized-dark t)
;;(load-theme 'solarized-light t)
;;(load-theme 'deeper-blue t)
(load-theme 'manoj-dark t)
;;(load-theme 'misterioso t)
;;(load-theme 'tango t)
;;(load-theme 'tsdh-dark t)
;;(load-theme 'tsdh-light t)
;;(load-theme 'wheatgrass t)
;;(load-theme 'adwaita t)
;;(load-theme 'dichromacy t)
;;(load-theme 'light-blue t)
;;(load-theme 'tango-dark t)
;;(load-theme 'wombat t)
;;(load-theme 'whiteboard t)

;;;;Color-Settings end here  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
