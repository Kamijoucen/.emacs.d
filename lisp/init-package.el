;; Settings for company, auto-complete only for coding.
(use-package company
  :hook ((prog-mode . company-mode)
         (inferior-emacs-lisp-mode . company-mode))
  :config (setq company-minimum-prefix-length 1
                company-show-quick-access nil))

(use-package flymake
  :ensure nil
  :bind (("M-n" . flymake-goto-next-error)
  ("M-p" . flymake-goto-prev-error)))

;; Settings for which-key - suggest next key
(use-package which-key
  :hook (after-init . which-key-mode))

(provide 'init-package)
