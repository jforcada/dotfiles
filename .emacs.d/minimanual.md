# Emacs Customizations Manual

## Packaging

Check for package updates:

```emacs
M-x list-packages
```

- `U` to update everything.
- `x` to do the update.
- `d` to delete.

### Install new package permanently

1. Add the package to the `general/package-setup.el` list:

```elisp
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
```

2. Add the setup code of the package in the sections below the list.
