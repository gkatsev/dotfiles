if [[ "$OSTYPE" =~ "^darwin.*" ]]
then

    alias e='mvim'
    alias vi='vim'
    alias vim="mvim -v"
    alias zshconfigreload='. ~/.zshrc'
    alias zshconfig="mvim -v ~/.zshrc"

    alias canary="open -a /Applications/Google\ Chrome\ Canary.app/"
    alias chrome="canary"
    alias chromes="open -a /Applications/Google\ Chrome.app/"
    alias firefox="open -a /Applications/FirefoxAurora.app/"

    launchctl setenv PATH $PATH
fi
