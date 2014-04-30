#!/usr/bin/env bash
function link_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    if [ -e "${target}" ]; then
        mv $target $target.bak
    fi

    ln -sf ${source} ${target}
}

if [ "$1" = "vim" ]; then
    for i in _vim*
    do
       link_file $i
    done
else
    for i in _*
    do
        link_file $i
    done
fi

VUNDLE_DIR="_vim/bundle/vundle"
if [ ! -d "$VUNDLE_DIR" ]; then
    git clone https://github.com/gmarik/Vundle.vim $VUNDLE_DIR
    vim +PluginInstall +qall!
else 
    cd $VUNDLE_DIR
    git pull origin master
    vim +PluginUpdate +qall!
fi

