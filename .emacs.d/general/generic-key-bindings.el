;; generic-key-bindings.el
;; Author: Jaime Forcada Balaguer - jforcada
;; Email: jaime.forcada.balaguer@gmail.com
;;
;; Provides generic key binding functions that don't depend on any
;; major or minor mode.

(defun insert-bracket-pair (leftBracket rightBracket)
  "Insert a matching bracket, or wraps the active region"
  (if (region-active-p)
      (let ((p1 (region-beginning)) (p2 (region-end)))
        (goto-char p2)
        (insert rightBracket)
        (goto-char p1)
        (insert leftBracket)
        (goto-char (+ p2 2)))
    (progn
      (insert leftBracket rightBracket)
      (backward-char 1))))

(defun add-global-keybinding-pair-paren ()
  """Call attach insert-backet-pair for () to '(' key"""
  (defun insert-pair-paren ()
    (interactive)
    (insert-bracket-pair "(" ")"))
  (global-set-key (kbd "(") 'insert-pair-paren))

(defun add-global-keybinding-pair-curly-brace ()
  """Call attach insert-backet-pair for {} to '{' key"""
  (defun insert-pair-curly-brace ()
    (interactive)
    (insert-bracket-pair "{" "}"))
  (global-set-key (kbd "{") 'insert-pair-curly-brace))

(defun add-global-keybinding-pair-bracket ()
  """Call attach insert-backet-pair for [] to '[' key"""
  (defun insert-pair-bracket ()
    (interactive)
    (insert-bracket-pair "[" "]"))
  (global-set-key (kbd "[") 'insert-pair-bracket))

(defun add-global-keybinding-pair-angle-quote ()
  """Call attach insert-backet-pair for <> to '<' key"""
  (defun insert-pair-angle-quote ()
    (interactive)
    (insert-bracket-pair "<" ">"))
  (global-set-key (kbd "<") 'insert-pair-angle-quote))

(defun add-global-keybinding-pair-single-quote ()
  """Call attach insert-backet-pair for '' to ''' key"""
  (defun insert-pair-single-quote ()
    (interactive)
    (insert-bracket-pair "'" "'"))
  (global-set-key (kbd "'") 'insert-pair-single-quote))

(defun add-global-keybinding-pair-double-quote ()
  """Call attach insert-backet-pair for \"\" to '\"' key"""
  (defun insert-pair-double-quote ()
    (interactive)
    (insert-bracket-pair "\"" "\""))
  (global-set-key (kbd "\"") 'insert-pair-double-quote))


;; Expose the module features for require function
(provide 'generic-key-bindings)
