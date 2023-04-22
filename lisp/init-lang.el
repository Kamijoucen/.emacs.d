(use-package eglot
  :hook ((go-mode
          java-mode) . eglot-ensure)
  :bind (("C-c e f" . #'eglot-format)
         ("C-c e a" . #'eglot-code-actions)
         ("C-c e i" . #'eglot-code-action-organize-imports)
         ("C-c e q" . #'eglot-code-action-quickfix))
  :config
  ;; (setq eglot-ignored-server-capabilities '(:documentHighlightProvider))
  (defun eglot-actions-before-save()
    (add-hook 'before-save-hook
              (lambda ()
                (call-interactively #'eglot-format)
                (call-interactively #'eglot-code-action-organize-imports))))
  (add-hook 'eglot--managed-mode-hook #'eglot-actions-before-save))

;;(cl-defmethod eglot-execute-command
;;  ((_server eglot-eclipse-jdt) (_cmd (eql java.apply.workspaceEdit)) arguments))

(provide 'init-lang)
