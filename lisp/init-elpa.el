(package-initialize)

(setq package-check-signature nil)

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(unless (bound-and-true-p package--initialized)
  (package-initialize))

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
