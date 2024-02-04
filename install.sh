#!/bin/sh

SRC=/tmp/dotfiles
DST=~/.config

if [ $# -ge 1 ]; then
    echo "Overwriting default config source directory to \"$1\""
    SRC=$1
fi

if [ ! -d $SRC ]; then
    echo "Source directory \"$SRC\" does not exist."
    echo "You can overwrite default source directory in argument: $0 [path/to/config]"
    exit 1
fi

copy_config() {
    if [ -d $DST/$1 ] || [ -f $DST/$1  ]; then
        echo "Removing existing configuration under \"$DST/$1\"..."
        rm -rf $DST/$1
    fi
    echo "Copying \"$SRC/$1\" configuration to \"$DST/$1\"..."
    cp -r $SRC/$1 $DST/$1
}

copy_config nvim
copy_config tmux
copy_config sublime-text/Packages/User/Preferences.sublime-settings
