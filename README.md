# jonicho's dotfiles

This repository contains my personal dotfiles, managed using [GNU Stow](https://www.gnu.org/software/stow/).

## Installation

To install the dotfiles, simply clone this repository into `~/.dotfiles` and run `stow .` from within the repository:

```sh
git clone https://github.com/jonicho/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
```

> [!IMPORTANT]
> Make sure to change the name and email in the [git config](.config/git/config) to your name and email if you aren't me.
