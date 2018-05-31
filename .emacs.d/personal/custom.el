;; File custom.el
;; Sets a lot of configurations that I commonly use on my emacs

;; To view the column index
(column-number-mode 1)
;; To view line numbers
(global-linum-mode 1)
;; Setting the default font
(set-frame-font "Go Mono 11" nil t)
;; Set tab width to four
(setq-default tab-width 4)
;; Org support for shift select
(setq-default org-support-shift-select 1)
;; Wakatime mode
(if (package-installed-p 'wakatime-mode))

(if (package-installed-p 'wakatime-mode)
    (setq-default wakatime-api-key "<your api-key>"
                  lobal-wakatime-mode 1)
  (package-install 'wakatime-mode))

;; Setting default style for c/c++ programming languages
(setq-default c-default-style "stroustrup")
(setq-default c++-default-style "stroustrup")

(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;; to avoid scale problems
(with-eval-after-load 'linum
  (set-face-attribute 'linum nil :height 100))

;; company-irony configuration
(if (package-installed-p 'company)
    (eval-after-load 'company
      '(add-to-list 'company-backends 'company-irony))

  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)

  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (package-install 'company))

;; toc-org stuff
(if (package-installed-p 'toc-org)
    (if (require 'toc-org nil t)
        (add-hook 'org-mode-hook 'toc-org-enable)
      (warn "toc-org not found"))
  (package-install 'toc-org))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes (quote (manoj-dark)))
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (exec-path-from-shell toc-org slime lua-mode csharp-mode company-irony company-c-headers cmake-mode yaml-mode markdown-mode company wakatime-mode zop-to-char zenburn-theme which-key volatile-highlights undo-tree smartrep smartparens smart-mode-line operate-on-number move-text magit projectile ov imenu-anywhere guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major dash crux browse-kill-ring beacon anzu ace-window)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(safe-local-variable-values
   (quote
    ((checkdoc-minor-mode . t)
     (flycheck-disabled-checkers emacs-lisp-checkdoc))))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(wakatime-cli-path "/home/ranu/.local/bin/wakatime")
 '(wakatime-python-bin nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; custom.el ends here
