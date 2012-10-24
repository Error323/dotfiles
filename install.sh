#!/bin/bash

# Create symbolic links for all dotfiles
# By F. Huizinga (Wed Oct 24 21:47:33 CEST 2012)

set -e

for f in *
do
  if [ $f = 'install.sh' ]
  then
    continue
  fi

  dotfile=.$f

  rm -vf $HOME/$dotfile
  ln -vs `pwd`/$f $HOME/$dotfile
done
