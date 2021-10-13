#!/usr/bin/env zsh

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

if [ ! -e $HOME/.config/nvim ]
  then
    echo "Linking nvim"
    cmd="ln -s `pwd`/nvim $HOME/.config/nvim"
    echo $cmd
    eval $cmd
  else
    echo "nvim already exists"
fi

# on linux
if [[ "$OSTYPE" =~ "^linux-*" ]] then
  echo "Installing ag and shellcheck"
  sudo apt install silversearcher-ag shellcheck
# on macos
elif [[ "$OSTYPE" =~ "^darwin.*" ]] then
  echo "Installing ag and shellcheck"
  brew install the_sliver_searcher shellcheck
fi

# install fzf
if [ ! -e ~/.fzf ]
then
  echo "Installing fzf"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

echo "Finished installing"
