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

        ;; Autocompletion
        corfu
        lsp-mode

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
;; -------

;; ------- Autocompletion -------
(use-package corfu
  :hook
  (prog-mode . (lambda () (setq-local corfu-auto t)))
  :init
  (global-corfu-mode))

(use-package emacs
  :custom
  (tab-always-indent 'complete)
  (read-extended-command-predicate #'command-completion-default-include-p))

;; Enable auto completion, configure delay, trigger and quitting
(setq corfu-auto t
      corfu-auto-delay 0.2
      corfu-auto-prefix 2
      corfu-auto-trigger "." ;; Custom trigger characters
      corfu-preview-current 'insert
      corfu-quit-no-match 'separator) ;; or t

(use-package lsp-mode
  :custom
  (lsp-completion-provider :none) ; Use Corfu instead of built-in autocompletion
  :hook (lsp-completion-mode . my/lsp-mode-setup-completion))

(setq lsp-clients-clangd-executable "/usr/bin/clangd")

;; Enable autocompletion for major modes
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'c-mode-hook #'lsp)
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
