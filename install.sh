#! /bin/bash

path=`pwd`
# sanity check
dir=`echo $path | sed 's/.*\/\(.*\)/\1/'`
if [ $dir != 'dotfiles' ]; then
    echo "please run this script under dotfiles/"
    exit
fi

files_to_home=('.bashrc' '.zshrc' '.zshenv' '.gitconfig' '.rgignore' '.tmux.conf' '.vimrc')
for file in ${files_to_home[@]}; do
    if [ ! -f "$HOME/$file" ]; then
	ln -s "$path/$file" "$HOME/$file"
    fi
done
if [ ! -f "$HOME/.gitignore" ]; then
    ln -s "$path/.gitignore_global" "$HOME/.gitignore"
fi 

# mpv
if [ ! -f "$HOME/.config/mpv/input.conf" ]; then
    ln -s "$path/mpv/input.conf" "$HOME/.config/mpv/input.conf"
fi
if [ ! -f "$HOME/.config/mpv/mpv.conf" ]; then
    ln -s "$path/mpv/mpv.conf" "$HOME/.config/mpv/mpv.conf"
fi

# autokey
if [ "$OSTYPE" == 'linux-gnu' ] && [ ! -d "$HOME/.config/autokey/data/AutoKey" ]; then
    ln -s "$path/AutoKey" "$HOME/.config/autokey/data/AutoKey"
fi

