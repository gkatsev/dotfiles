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
    serve -p 8000 -C -c 0
  fi
}

gitdefaultmain() {
  git branch -m master main
  git fetch origin
  git branch -u origin/main main
  git remote set-head origin -a
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

gitcleanprs() {
  !git checkout master ; git for-each-ref refs/heads/pr/* --format="%(refname)" | while read ref ; do branch=${ref#refs/heads/} ; git branch -D $branch ; done
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


BASE16_SHELL=$HOME/.config/base16-shell/
if [ -s "$BASE16_SHELL" ]; then
  [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
  base16_solarized-dark
fi

[ -s "/Users/gkatsevman/.nvm/nvm.sh" ] && . "/Users/gkatsevman/.nvm/nvm.sh" # This loads nvm
[ -s "/home/gkatsev/.nvm/nvm.sh" ] && . "/home/gkatsev/.nvm/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

PATH=$HOME/bin:/opt/homebrew/bin:/opt/android-sdk-macosx/platform-tools:/Users/gkatsevman/.rbenv/bin:/Users/gkatsevman/.gem/ruby/2.0.0/bin:$PATH
PATH="/opt/homebrew/opt/qt/bin:$PATH"
PATH=$PATH:"/Users/gkatsevman/Library/Python/2.7/bin"
PATH=$PATH:"/Users/gkatsevman/Library/Python/3.7/bin"

alias e='nvim'
alias vi='nvim'
alias vim="nvim"
alias zshconfigreload='. ~/.zshrc'
alias zshconfig="nvim ~/.zshrc"

if [[ "$OSTYPE" =~ "^darwin.*" ]] then

  alias canary="open -a /Applications/Google\ Chrome\ Canary.app/"
  alias chrome="canary"
  alias chromes="open -a /Applications/Google\ Chrome.app/"
  alias firefox="open -a /Applications/FirefoxAurora.app/"

  export EDITOR=nvim

  #. /Users/gkatsevman/.nix-profile/etc/profile.d/nix.sh

  export GIT_HTTP_BACKEND="/Library/Developer/CommandLineTools/usr/libexec/git-core/git-http-backend"

  launchctl setenv PATH $PATH

  source ~/.iterm2_shell_integration.zsh
  source ~/p/dotfiles/slowquit.sh
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
