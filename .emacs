;;tar -cfz emacs_setup.tar .emacs .emacs.d
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Don't display the 'Welcome to GNU Emacs' buffer on startup
(setq inhibit-startup-message t)

;; Don't insert instructions in the *scratch* buffer
(setq initial-scratch-message nil)

;; straight to *scratch* buffer please
(setq inhibit-splash-screen t)

(setq tab-width 2)
(setq-default tab-width 2)
;; untabify on save                                                                                                                                                                                               
;; source: http://www.emacswiki.org/emacs/UntabifyUponSave and                                                                                                                                                    
;; http://stackoverflow.com/questions/318553/getting-emacs-to-untabify-when-saving-certain-file-types-and-only-those-file-ty                                                                                      
;; and a little help from http://ergoemacs.org/emacs/emacs_avoid_lambda_in_hook.html                                                                                                                              
;; and help from http://stackoverflow.com/questions/1931784/emacs-is-before-save-hook-a-local-variable                                                                           
(defun untab-all ()
  (untabify (point-min) (point-max))
   nil ) ; did not write buffer to disk

(defun add-write-contents-hooks-hook ()
  (add-hook
   'write-contents-hooks
   'untab-all
     nil  ; APPEND  unrelated, explicit default nil as optional :)
     t )) ; LOCAL   non-nil => make hook local

;; more modes: http://www.emacswiki.org/CategoryModes
(add-hook 'emacs-lisp-mode-hook #'add-write-contents-hooks-hook)
(add-hook 'c-mode-common-hook   #'add-write-contents-hooks-hook)
(add-hook 'verilog-mode-hook   #'add-write-contents-hooks-hook)
(add-hook 'sh-mode-hook         #'add-write-contents-hooks-hook)
(add-hook 'text-mode-hook       #'add-write-contents-hooks-hook)
(add-hook 'sql-mode-hook        #'add-write-contents-hooks-hook)
(add-hook 'css-mode-hook        #'add-write-contents-hooks-hook)                

(global-set-key "\C-g" 'goto-line)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(verilog-indent-level 2)
 '(verilog-indent-level-behavioral 2)
 '(verilog-indent-level-declaration 2)
 '(verilog-indent-level-module 2)
 '(verilog-indent-tabs-mode nil))

;; etags table
(require 'etags-table)

;;(setq etags-table-alist
;;      (list
;;       `(,(concat "$PROJ_HOME/testbench/memsys/sim/TAGS"))))
;;       `(,(concat "/projects/pd/ares_val/brifra01/worka/ares1/testbench/memsys/sim/TAGS"))))

(setq etags-table-search-up-depth 15) ;; Max depth to search up for a tags file.  nil means don't search.

;; Below function comes useful when you change the project-root symbol to a
;; different value (when switching projects)
;;(defun update-etags-table-then-find-tag ()
;;  "Update etags-table based on the current value of project-root and then do
;;tag find"
;;  (interactive)
;;  (when (boundp 'project-root) ;; add-to-list if project-root symbol is defined
;;    (add-to-list 'etags-table-alist
;;                 `(,(concat project-root "/.*") ,(concat project-root "/TAGS")) t))
;;  (etags-select-find-tag-at-point)
;;  )


;; etags-select
(require 'etags-select)
(define-key etags-select-mode-map (kbd "C-g")   'etags-select-quit)
;; Also quit etags-select when cursor moves to another window
(define-key etags-select-mode-map (kbd "C-x o") 'etags-select-quit)
(define-key etags-select-mode-map (kbd "C-x O") 'etags-select-quit)
(define-key etags-select-mode-map (kbd "C-p")   'etags-select-previous-tag)
(define-key etags-select-mode-map (kbd "C-n")   'etags-select-next-tag)

(require 'anything-exuberant-ctags)

;; mouse keybinding
;;(global-set-key (kbd "M-.") 'update-etags-table-then-find-tag)
(global-set-key "\M-." 'etags-select-find-tag)

(require 'load-dir)
(load-dir-one "~/.emacs.d/my_own_els")
(require 'yasnippet-bundle)
(yas/initialize)
(setq yas/root-directory "~/.emacs.d/snippets")
(yas/load-directory "~/.emacs.d/snippets")
(yas/load-directory "~/.emacs.d/snippets/verilog-mode")
(add-hook 'verilog-mode-hook (lambda () (setq comment-start "//"
                                        comment-end   "")))
(add-to-list 'load-path "/home/jatpai01/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-classic)))
(add-to-list 'auto-mode-alist '("\\.svh\\'" . verilog-mode))
