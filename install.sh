#!/usr/bin/env sh

files="vimrc vimperatorrc vimperator gitconfig hgrc ttytterrc screenrc"
for file in $files; do
  echo "Linking .$file"
  cmd="ln -s `pwd`/$file $HOME/.$file"
  echo $cmd
  eval $cmd
done

echo "Finished installing"
