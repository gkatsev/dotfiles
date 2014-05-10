#!/usr/bin/env sh

files="vimrc vimperatorrc vimperator gitconfig hgrc ttytterrc screenrc zshrc vim"
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

echo "Finished installing"
