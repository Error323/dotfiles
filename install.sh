#!/bin/bash

# Create symbolic links for all dotfiles
# By F. Huizinga (Wed Oct 24 21:47:33 CEST 2012)

set -e

for file in *
do
  if [ $file = 'install.sh' ]
  then
    continue
  fi

  dotfile=.$file

  rm -vf $HOME/$dotfile
  ln -vs `pwd`/$file $HOME/$dotfile
done
