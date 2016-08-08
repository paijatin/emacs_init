
;; speedbar - trying to replicate tagbar
(speedbar 1)
(speedbar-add-supported-extension ".sv")
(speedbar-add-supported-extension ".svh")
(add-hook 'speedbar-load-hook (lambda () (require 'semantic/sb)))

;;(add-to-list 'load-path "~/.emacs.d/setup_files")
(require 'load-dir)
;;(setq load-dirs)
;;(load-dir-one "~/.emacs.d/setup_files")
(setq speedbar-fetch-etags-command "/usr/bin/ctags"
      speedbar-fetch-etags-arguments '("-e" "-f TAGS"))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq speedbar-fetch-etags-parse-list
  '(;; Note that java has the same parse-group as c
    ("\\.\\([cChH]\\|c\\+\\+\\|cpp\\|cc\\|hh\\|java\\|sv\\|svh)\\'" .
     speedbar-parse-c-or-c++tag)
    ("^\\.emacs$\\|.\\(el\\|l\\|lsp\\)\\'" .
     "def[^i]+\\s-+\\(\\(\\w\\|[-_]\\)+\\)\\s-*\C-?")
;    ("\\.\\([fF]\\|for\\|FOR\\|77\\|90\\)\\'" .
;      speedbar-parse-fortran77-tag)
    ("\\.tex\\'" . speedbar-parse-tex-string)
    ("\\.p\\'" .
     "\\(\\(FUNCTION\\|function\\|PROCEDURE\\|procedure\\)\\s-+\\([a-zA-Z0-9_.:]+\\)\\)\\s-*(?^?")
    )
)

(speedbar nil)
