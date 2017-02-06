#!/usr/bin/env sh

files="gitconfig"
for file in $files; do
  if [ ! -e $HOME/.$file ]
  then
    echo "Linking .$file"
    cmd="ln -s `pwd`/$file $HOME/.$file"
    echo $cmd
    eval $cmd
  else
    echo ".$file already exists"
  fi
done

if [ ! -e $HOME/.config nvim ]
  then
    echo "Linking nvim"
    cmd="ln -s nvim $HOME/.config/nvim"
    echo $cmd
    eval $cmd
  else
    echo "nvim already exists"
fi


echo "Finished installing"
