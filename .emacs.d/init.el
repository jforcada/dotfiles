;; init.el
;; Author: Jaime Forcada Balaguer - jforcada
;; Email: jaime.forcada.balaguer@gmail.com

;; Define the directories to load resources from
(defvar emacs.d-dir (file-name-directory load-file-name))
(add-to-list 'load-path (concat emacs.d-dir "./general"))
(add-to-list 'load-path (concat emacs.d-dir "./themes"))
(add-to-list 'custom-theme-load-path (concat emacs.d-dir "./themes"))

;; ------- General configuration -------

;; Disable tabs indentation by default...
(setq-default indent-tabs-mode nil)
;; ... if major mode forces tabs, set them to width=2
(setq-default tab-width 2)

;; set fill-column default to 80 chars
(setq-default fill-column 80)

;; set Unix line termination char LF by default
(setq-default buffer-file-coding-system 'utf-8-unix)

;; set system bell off
(setq ring-bell-function 'ignore)

;; cd into work directory for Windows, because it defaults to emacs installation
;; one
(if (string= system-type "windows-nt")
    (cd "c:/Users/elmal/work/"))

;; Assure that special input (like accent marks) works
(require 'iso-transl)

;; Set up keybindings
(require 'generic-key-bindings)
(add-global-keybinding-pair-paren)
(add-global-keybinding-pair-curly-brace)
(add-global-keybinding-pair-double-quote)

;; Activate generic ui configuration
(require 'ui-config)

;; -----------------------------------

;; ------- Keybindings -------

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; ---------------------------

;; Setup font, in Windows the font is not parametherized by weight
(if (string= system-type "windows-nt")
    (add-to-list 'default-frame-alist
                 '(font . "Ubuntu Sans Mono Medium-12"))
  (add-to-list 'default-frame-alist
               '(font . "Ubuntu Sans Mono-12:weight=medium"))
  )

;; -----------------------------------

;; ------- Package setup & installation -------

(require 'pkg-init)

;; ---------------------------------------

;; -------------------------------
;; !!!! DO NOT MODIFY BY HAND !!!!
;; -------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c46651ab216eb31e699be1bd5e6df8229b08005b534194c1ea92519b09661d71" "7ce3a35c349be254e82a3c4f0f555639e729ef07cdd1c5c9f0358163eff99fe6" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))
 '(package-selected-packages
   '(catppuccin-theme night-owl-theme vertico orderless move-text markdown-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; -------------------------------
;; !!!! END OF WARNING !!!!
;; -------------------------------
