
(use-package go-mode)
(use-package kotlin-mode)
(use-package markdown-mode)
(use-package protobuf-mode)
(use-package yaml-mode)

(defun prog-extra-modes()
  "Extra modes when in programming mode."

  (column-number-mode)
  (display-line-numbers-mode)
  (electric-pair-mode)
  (flymake-mode)
  (hs-minor-mode)
  (prettify-symbols-mode)

  (use-package highlight-parentheses
    :hook (prog-mode . highlight-parentheses-mode)))
(add-hook 'prog-mode-hook 'prog-extra-modes)

(use-package yasnippet :config (yas-global-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (defun lsp-save-actions ()
    "LSP actions before save."
    (add-hook 'before-save-hook #'lsp-organize-imports t t)
	(add-hook 'before-save-hook #'lsp-format-buffer t t))
  :hook ((lsp-mode . #'lsp-enable-which-key-integration)
         (lsp-mode . #'lsp-save-actions)
         ((c-mode
           c++-mode
           go-mode
           java-mode) . lsp-deferred))
  :config
  (setq lsp-auto-guess-root t
	    lsp-headerline-breadcrumb-enable nil
	    lsp-keymap-prefix "C-c l"
	    lsp-log-io nil)
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  :config
  (setq lsp-ui-peek-enable t)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-imenu-enable t)
  (setq lsp-ui-flymake-enable t)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-ignore-duplicate t))

(use-package lsp-java
  :after lsp-mode
  :if (executable-find "mvn")
  :init
  (use-package request :defer t))

(setq lsp-java-vmargs
  '("-noverify"
    "-Xmx1G"
    "-XX:+UseG1GC"
    "-XX:+UseStringDeduplication"
    "-javaagent:/home/kamijoucen/lombok.jar"
    "-Xbootclasspath/a:/home/kamijoucen/lombok.jar"))

(provide 'init-lang)
