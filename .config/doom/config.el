(setq doom-font (font-spec :family "JetBrainsMonoNL Nerd Font" :size 16)
      doom-variable-pitch-font (font-spec :family "Inter" :size 16))

(setq doom-theme 'doom-tomorrow-night)

(custom-set-faces!
  '(font-lock-function-call-face :slant normal))

(after! apheleia
  (setf (alist-get 'go-mode apheleia-mode-alist) 'goimports)
  (setf (alist-get 'go-ts-mode apheleia-mode-alist) 'goimports))

(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . web-mode))

(after! go-ts-mode
  (setq go-ts-mode-indent-offset 4))

(setq display-line-numbers-type 'relative)
(setq confirm-kill-emacs nil)
(setq scroll-margin 8)

(setq shell-file-name (executable-find "bash"))
(setq-default ghostel-shell "/bin/fish")
(setq-default explicit-shell-file-name "/bin/fish")

(setq evil-escape-key-sequence "jk")

(map! :n "H" #'previous-buffer
      :n "L" #'next-buffer
      :i "C-S-v" #'clipboard-yank)

(custom-theme-set-faces!
  'doom-tomorrow-night
  '(org-level-8 :inherit outline-3 :height 1.0)
  '(org-level-7 :inherit outline-3 :height 1.0)
  '(org-level-6 :inherit outline-3 :height 1.1)
  '(org-level-5 :inherit outline-3 :height 1.2)
  '(org-level-4 :inherit outline-3 :height 1.3)
  '(org-level-3 :inherit outline-3 :height 1.4)
  '(org-level-2 :inherit outline-2 :height 1.5)
  '(org-level-1 :inherit outline-1 :height 1.6)
  '(org-document-title :height 1.8 :bold t :underline nil))

(setq org-directory "~/Org/")
(add-hook 'org-mode-hook #'hl-todo-mode)

(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.6))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.2))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.1)))))

(defun dt/toggle-markdown-view-mode ()
  "Toggle between `markdown-mode' and `markdown-view-mode'."
  (interactive)
  (if (eq major-mode 'markdown-view-mode)
      (markdown-mode)
    (markdown-view-mode)))

(add-hook! 'elfeed-search-mode-hook #'elfeed-update)
