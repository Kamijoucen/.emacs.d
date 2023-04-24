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

;; fount

(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))

(defun kamijoucen/font-setup ()
  "Font setup."

  (interactive)
  (when (display-graphic-p)
    ;; Default font
    (cl-loop for font in '("Courier Prime" "Cascadia Code" "Fira Code" "Jetbrains Mono" "Hack" "Source Code Pro" "Menlo" "Monaco" "Consolas")
             when (font-installed-p font)
             return (set-face-attribute 'default nil :family font))

    ;; Unicode characters
    (cl-loop for font in '("Segoe UI Symbol" "Symbola" "Symbol")
             when (font-installed-p font)
             return (set-fontset-font t 'unicode font nil 'prepend))

    ;; Emoji
    (cl-loop for font in '("Noto Color Emoji" "Apple Color Emoji")
             when (font-installed-p font)
             return (set-fontset-font t 'emoji (font-spec :family font) nil 'prepend))

    ;; Chinese characters
    (cl-loop for font in '("霞鹜文楷" "WenQuanYi Micro Hei" "PingFang SC" "Microsoft Yahei UI" "Microsoft Yahei" "STFangsong")
             when (font-installed-p font)
             return (progn
                      (setq face-font-rescale-alist `((,font . 1.2)))
                      (set-fontset-font t '(#x4e00 . #x9fff) (font-spec :family font))))))

(add-hook 'emacs-startup-hook 'kamijoucen/font-setup)

(provide 'init-ui)
