;; pkg-init.el
;; Author: Jaime Forcada Balaguer - jforcada
;; Email: jaime.forcada.balaguer@gmail.com


;; ------- Setup -------

;; Add MELPA repository
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

;; Init the package facility
(require 'package)
(package-initialize)

;; Update package list cache
(package-refresh-contents)

;; --------------------------------------

;; ------- Packages to install -------

;; List of packages to install
(setq my-packages
      '(;; Themes
        catppuccin-theme

        ;; Major modes & complements
        markdown-mode ;; to edit .md files

        ;; Minor modes & complements
        move-text ;; to move up/down lines and regions
        vertico ;; minibuffer autocompletion
        orderless ;; completion style
        ))

;; Iterate the list of packages and install them
(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; -------

;; ------- Themes -------
(load-theme 'catppuccin :no-confirm)

;; ------- Major modes initialization -------

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))

;; -------

;; ------- Minor modes initialization -------

;; Enable move-text
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

(provide 'package-setup)
