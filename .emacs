;;LOAD_PATH
(add-to-list 'load-path' "/home/move/.emacs.d/site-lisp")
(require 'xcscope)

(add-to-list 'load-path' "/home/move/.emacs.d/company-mode")
(autoload 'company-mode "company" nil t)
(setq company-idle-delay t)

(add-to-list 'load-path
	     "/home/move/.emacs.d/plugins")
(require 'yasnippet-bundle)

(define-key global-map [(control f3)]  'cscope-set-initial-directory)
(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map [(control f5)]  'cscope-find-this-symbol)
(define-key global-map [(control f6)]  'cscope-find-global-definition)
(define-key global-map [(control f7)]  'cscope-find-global-definition-no-prompting)
(define-key global-map [(control f8)]  'cscope-pop-mark)
(define-key global-map [(control f9)]  'cscope-next-symbol)
(define-key global-map [(control f10)] 'cscope-next-file)
(define-key global-map [(control f11)] 'cscope-prev-symbol)
(define-key global-map [(control f12)] 'cscope-prev-file)
(define-key global-map [(meta f9)]     'cscope-display-buffer)
(define-key global-map [(meta f10)]    'cscope-display-buffer-toggle)

; auto complete
(add-to-list 'load-path "/home/move/.emacs.d/auto-complete")  
(require 'auto-complete-config)  
(add-to-list 'ac-dictionary-directories "/home/move/.emacs.d/auto-complete/ac-dict")  
(ac-config-default)
(setq ac-use-quick-help nil)
(setq ac-auto-start 4) ;; 输入4个字符才开始补全
(global-set-key "\M-/" 'auto-complete)  ;; 补全的快捷键，用于需要提前补全
;; Show menu 0.8 second later
(setq ac-auto-show-menu 0.8)
;; 选择菜单项的快捷键
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
;; menu设置为12 lines
(setq ac-menu-height 12)


;;禁止自动备份
(setq make-backup-files nil)

;;设置tab宽度为4
(setq-default indent-tabs-mode  nil)
(setq tab-width 4 c-basic-offset 4)
;;(setq tab-width 4 indent-tabs-mode nil)

;显示匹配括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;滚动页面时比较舒服，不要整页的滚动
(setq     scroll-step 1
scroll-margin 3
scroll-conservatively 10000)


;;显示行号;;
(dolist (hook (list
'c-mode-hook
'c++-mode-hook
'emacs-lisp-mode-hook
'lisp-interaction-mode-hook
'lisp-mode-hook
'emms-playlist-mode-hook
'java-mode-hook
'asm-mode-hook
'haskell-mode-hook
'rcirc-mode-hook
'emms-lyrics-mode-hook
'erc-mode-hook
'sh-mode-hook
'makefile-gmake-mode-hook
))
(add-hook hook (lambda () (linum-mode 1))))


;;显示行号和列号
(column-number-mode t)
(setq mouse-yank-at-point t)


;;主题配色；；
;(add-to-list 'custom-theme-load-path "/home/move/.emacs.d/themes/")
;(load-library "/home/move/.emacs.d/themes/Amelie-theme.el")

;;自动插入匹配的括号
;;C/C++  mode
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
    (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)    
  (backward-char))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)

;;在状态条上显示当前光标在哪个函数体内部
  (which-function-mode)







































(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "white" :inverse-video t)))))
