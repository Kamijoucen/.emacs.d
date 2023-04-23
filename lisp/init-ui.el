(setq inhibit-startup-screen t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq frame-title-format "%b - kamijoucen's Emacs")

(setq tab-width 4 fill-column 72)

(use-package zenburn-theme
  :init (load-theme 'zenburn  t))

;; mode line
(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))

(global-display-line-numbers-mode t)

(provide 'init-ui)
