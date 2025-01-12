#!/bin/bash

# inspired by https://github.com/rexim/dotfiles/blob/master/deploy.sh

set -e

SCRIPT_DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"
DOTFILES_DIR=$SCRIPT_DIR/dotfiles

files=$(find $DOTFILES_DIR -type f -printf "%P\n")
for file in $files
do
    dotfiles_file=$DOTFILES_DIR/$file
    home_file=$HOME/$file

    if [[ -L $home_file ]]; then
        echo "Waring: $file is already a symlink, skipping..."
        continue
    fi

    if [[ -e $home_file ]]; then
        echo "Error: $file already exists but is not a symlink"
        exit 1
    fi

    mkdir -p $(dirname $home_file)
    ln -s $dotfiles_file $home_file

    echo "Linked: $file -> $home_file"
done
