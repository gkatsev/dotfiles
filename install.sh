#!/usr/bin/env sh

files="vimrc vimperatorrc vimperator gitconfig hgrc ttytterrc screenrc zshrc oh-my-zsh vim"
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

theme="rkj-repos-gkatsev.zsh-theme"
themeF="$HOME/.oh-my-zsh/themes/$theme"
if [ ! -e $themeF ]
  then
  cmd="ln -s `pwd`/$theme $themeF"
  echo $cmd
  eval $cmd
else
  echo "$themeF already exists"
fi

echo "Finished installing"
