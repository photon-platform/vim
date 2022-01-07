#!/usr/bin/env bash

if [[ -e ~/.vimrc ]]; then
  D=$(date +"%Y%m%d-%T")
  echo mv ~/.vimrc ~/.vimrc.$D.bak
  mv ~/.vimrc ~/.vimrc.$D.bak
fi
echo ln -sf ~/.vim/.vimrc ~/.vimrc
ln -sf ~/.vim/.vimrc ~/.vimrc




