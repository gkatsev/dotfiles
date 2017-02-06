######
# The following lines were added by compinstall

zstyle ':completion:*' file-sort size reverse
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 0 not-numeric
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/Users/gkatsevman/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=999999
SAVEHIST=999999
setopt appendhistory
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
######

autoload -U promptinit
promptinit
prompt adam2

spacecompute() {
  ssh -t gkatsev@spacecompute.com screen -xRR
}

servethis() {
  if (( $+commands[serve] )); then
    serve -p 8000 -H -C --compress -F short
  fi
}

gitpr() {
  local orig;
  if [ $3 ]; then
    orig=$3;
  else
    orig=origin;
  fi

  echo git fetch $orig pull/$1/head:$2
  git fetch $orig pull/$1/head:$2
  git checkout $2
}

gitrevertpr() {
  git revert -m 1 $1
}

# https://gist.github.com/gkatsev/1b524fd09e6a988d1b08
triforce() {
  for i in *; do
    if [ -d "$i" ]; then
      cd $i;
      if [ -f "package.json" ]; then
        zelda ../;
      fi;
      cd ..;
    fi;
  done
}

chpwd() {
  cwd=`pwd | sed -E "s_${HOME}/?_~/_"`
  echo -ne "\e]1;$cwd\a"
  unset home
  unset cwd
}

alias ls='ls -G'
alias gut='git'

if [[ "$OSTYPE" =~ "^darwin.*" ]] then
  alias e='mvim'
  alias vi='vim'
  alias vim="mvim -v"
  alias zshconfigreload='. ~/.zshrc'
  alias zshconfig="mvim -v ~/.zshrc"

  alias canary="open -a /Applications/Google\ Chrome\ Canary.app/"
  alias chrome="canary"
  alias chromes="open -a /Applications/Google\ Chrome.app/"
  alias firefox="open -a /Applications/FirefoxAurora.app/"

  export EDITOR=nvim

  #. /Users/gkatsevman/.nix-profile/etc/profile.d/nix.sh
fi


[ -s "/Users/gkatsevman/.nvm/nvm.sh" ] && . "/Users/gkatsevman/.nvm/nvm.sh" # This loads nvm

PATH=/opt/homebrew/bin:/opt/android-sdk-macosx/platform-tools:/Users/gkatsevman/.gem/ruby/2.0.0/bin:$PATH
