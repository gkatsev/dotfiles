#!/usr/bin/env zsh

files="vimrc vimperatorrc vimperator gitconfig hgrc ttytterrc screenrc zshrc oh-my-zsh"
for file in $files; do
  if [[ ! ( -a $HOME/.$file ) ]]
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
