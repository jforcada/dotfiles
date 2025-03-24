;; pkg-init.el
;; Author: Jaime Forcada Balaguer - jforcada
;; Email: jaime.forcada.balaguer@gmail.com

;; ------- Packages to install -------

;; Note: You might need to run package-install-selected-packages
'(package-selected-packages '(;; Major modes & complements
                              markdown-mode ;; to edit .md files
                              ;; Minor modes & complements
                              move-text ;; to move up/down lines and regions
                              vertico ;; minibuffer autocompletion
                              orderless ;; completion style
                              ))
(package-install-selected-packages)

;; -------
;; ------- Major modes initialization -------

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))

;; -------

;; ------- Minor modes initialization -------

(move-text-default-bindings)

;; Enable vertico
(use-package vertico
  :custom
  (vertico-count 10) ;; Show more candidates
  (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  :init
  (vertico-mode))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; -------

(provide 'pkg-init)
