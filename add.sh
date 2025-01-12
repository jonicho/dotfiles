#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"
DOTFILES_DIR=$SCRIPT_DIR/dotfiles

if [[ -z $1 ]]; then
    echo "Usage: $0 <file>"
    exit 1
fi

case $(realpath $1) in
    $HOME/*);;
    *)
        echo "Error: $1 is not in your home directory"
        exit 1
esac

file=$(realpath --relative-to=$HOME $1)
dotfiles_file=$DOTFILES_DIR/$file
home_file=$HOME/$file

if [[ ! -e $home_file ]]; then
    echo "Error: $file does not exist"
    exit 1
fi

if [[ ! -f $home_file ]]; then
    echo "Error: $file is not a regular file"
    exit 1
fi

if [[ -e $dotfiles_file ]]; then
    echo "Error: $file is already in dotfiles"
    exit 1
fi

mkdir -p $(dirname $dotfiles_file)
mv $home_file $dotfiles_file
echo "Moved: $home_file -> $dotfiles_file"
ln -s $dotfiles_file $home_file
echo "Linked: $dotfiles_file -> $home_file"
