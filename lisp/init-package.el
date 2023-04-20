(use-package restart-emacs)

(use-package flymake
  :ensure nil
  :diminish (flymake " Flym.")
  :hook (prog-mode . flymake-mode)
  :bind (("M-n" . flymake-goto-next-error)
	 ("M-p" . flymake-goto-prev-error)))

(provide 'init-package)
