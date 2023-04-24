(defconst *is-mac* (eq system-type 'darwin))
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

(cond
 (*is-windows*
  ;; fix the  issue on Windows
  ;; (setq buffer-file-coding-system 'utf-8)
  (when (boundp 'w32-get-true-file-attributes)
    (setq w32-get-true-file-attributes nil
	      w32-pipe-read-delay 0
	      w32-pipe-buffer-size (* 64 1024))))
 (*is-mac*
  ;; <macOS> Command -> Meta, Option -> Super
  (setq mac-command-modifier 'meta
	    mac-option-modifier 'super
	    ns-use-native-fullscreen t))
 (t nil))

 ;; encode
(prefer-coding-system 'utf-8)
(unless *is-windows*
    (set-selection-coding-system 'utf-8))

(provide 'init-startup)
