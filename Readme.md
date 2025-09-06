# Dotfiles

Clone the repo into the `$HOME/work` directory.

## Linux links

```
.emacs.d -> work/dotfiles/.emacs.d/
.fonts -> work/dotfiles/.fonts/
.gitconfig -> work/dotfiles/.gitconfig
.Xdefaults -> work/dotfiles/.Xdefaults
```

## Windows setup

For **emacs** init directory, you should make a symbolic link:

1. Open windows command line as administrator.
2. Run:

```shell
> mklink /D C:\Users\elmal\AppData\Roaming\.emacs.d C:\Users\elmal\work\dotfiles\.emacs.d
```

For **git** configuration, link the `.gitconfig` file:

1. Open windows command line as administrator.
2. Make a symbolic link:

``` shell
> mklink .gitconfig .\work\dotfiles\.gitconfig
```

For the **fonts**, double click all the fonts in `.fonts` directory and click on
"Install".

