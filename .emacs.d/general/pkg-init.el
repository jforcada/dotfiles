;; pkg-init.el
;; Author: Jaime Forcada Balaguer - jforcada
;; Email: jaime.forcada.balaguer@gmail.com

;; Package initialization
;;


;; Major modes
;; ----------------------------------

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))

;; ----------------------------------

;; Minor modes
;; ----------------------------------

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
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))
;; ----------------------------------

(provide 'pkg-init)
