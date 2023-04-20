(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;;                         ("org"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
(package-initialize) ;; You might already have this line

(setq package-check-signature nil)

(require 'package)

;; 初始化包管理器
(unless (bound-and-true-p package--initialized)
  (package-initialize))

;; 刷新软件源索引
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-always-demand nil
      use-package-expand-minimally t
      use-package-verbose t)

(require 'use-package)

(fido-mode t)

(provide 'init-elpa)
