;; ui-config.el
;; Author: Jaime Forcada Balaguer - jforcada
;; Email: jaime.forcada.balaguer@gmail.com

;; higlight current line
(global-hl-line-mode t)

;; deactivate cursor blink
(blink-cursor-mode 0)

;; set menu bar, to get desktop copy/paste for example
(menu-bar-mode t)

;; remove tool bar so we get 2 more editing lines
(tool-bar-mode 0)

;; show column number in the mode line
(column-number-mode t)

;; show line number in the mode line
(line-number-mode t)

;; show line numbers in the left side
(global-display-line-numbers-mode t)

;; disable startup screen
(setq inhibit-startup-screen t)

(provide 'ui-config)
