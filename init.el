

;; set gc time
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook #'(lambda () (setq gc-cons-threshold 800000)))

(add-to-list 'load-path
         (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; init
(require 'init-startup)

;; source
(require 'init-elpa)

;; package
(require 'init-package)

;; lsp
(require 'init-lang)

;; ui
(require 'init-ui)

;; kay bind
(require 'init-kb)
