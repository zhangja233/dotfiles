#! /bin/sh

path=`pwd`
# sanity check
dir=`echo $path | sed 's/.*\/\(.*\)/\1/'`
if [ $dir != 'dotfiles' ]; then
    echo "please run this script under dotfiles/"
    exit
fi

if [ -f ~/.bashrc ]; then
    rm ~/.bashrc
fi    

ln -s "$path/.bashrc" ~/.bashrc
