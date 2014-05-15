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

spacecompute() { ssh -t gkatsev@spacecompute.com screen -xRR }

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

    home=$(dirname ~/.)
    cwd=`pwd | sed -E "s_${home}/?_~/_"`
    echo -ne "\e]1;$cwd\a"
    unset home
    unset cwd
fi
