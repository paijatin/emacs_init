
(put 'upcase-region 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 101 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
(setq-default indent-tabs-mode nil);
(setq default-tab-width 4);  
(add-hook 'verilog-mode-hook (lambda () (setq comment-start "//"
                                        comment-end   "")))
(add-to-list 'load-path "/home/jatpai01/.emacs.d/color-theme-6.6.0")
(add-to-list 'load-path "/home/jatpai01/.emacs.d/emacs-color-theme-solarized")
(require 'color-theme)
(require 'color-theme-solarized)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-solarized)))
(add-to-list 'auto-mode-alist '("\\.svh\\'" . verilog-mode))