;; encode
(prefer-coding-system 'utf-8)
(unless *is-windows*
    (set-selection-coding-system 'utf-8))

(setq inhibit-startup-screen t)

(tool-bar-mode -1)
(menu-bar-mode -1)

(setq frame-title-format "%b - kamijoucen's Emacs")

;; stheme
(use-package emacs
  :init
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil
        modus-themes-region '(bg-only no-extend))
  :config
  (load-theme 'modus-vivendi)
  :bind ("<f5>" . modus-themes-toggle))

;; mode line
(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))

;; line number
;; (setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(provide 'init-ui)
