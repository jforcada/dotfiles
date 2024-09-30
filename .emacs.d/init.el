;; init.el
;; Author: Jaime Forcada Balaguer - jforcada
;; Email: jaime.forcada.balaguer@gmail.com

;; TODO
;; - Mark vertical line for char limit
;;   - https://emacs.stackexchange.com/questions/147/how-can-i-get-a-ruler-at-column-80
;; - Magit
;; - Move lines up & down with M-up & M-down
;; - Customizable indentation
;; - Pair tags in html mode
;; - Full screen, text centered mode

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

;; ------- Theme configuration -------
;; Set up theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4"
     default))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'gotham t)

;; Setup font
(add-to-list 'default-frame-alist
             '(font . "Ubuntu Sans Mono-12:weight=medium"))


;; IDO Autocompletion
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; -----------------------------------

;; ------- Setup MELPA repository -------

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; --------------------------------------

;; ------- Package initializations -------
(require 'pkg-init)
;; ---------------------------------------
