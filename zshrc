# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rkj-repos-gkatsev"

alias node="nocorrect node"
alias npm="nocorrect npm"
alias ack="nocorrect ack"

alias jslint="jslint --continue --eqeq --es5 --forin --plusplus --sloppy --vars false --cap --browser --devel --indent 4 --maxlen 100 --white --undef --nomen --regexp --bitwise --newcap"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew ant mvn github node npm python vagrant fasd history-substring-search)

source $ZSH/oh-my-zsh.sh
source ~/.profile

if [[ "$OSTYPE" =~ "^darwin.*" ]]
then

    alias vim="mvim -v"
    alias zshconfigreload='. ~/.zshrc'
    alias zshconfig="mvim -v ~/.zshrc"
    alias ohmyzsh="mvim -v ~/.oh-my-zsh"

    export PATH=/Users/gkatsevman/.rvm/gems/ruby-1.9.3-p194/bin:/Users/gkatsevman/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/gkatsevman/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/gkatsevman/.rvm/bin:/Users/gkatsevman/work/tools/apache-maven/3.0.3/bin:/Users/gkatsevman/work/tools/ant/1.7.1/bin:/Users/gkatsevman/work/users/brightcove/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/gkatsevman/work/sandbox/usr-local/origin-services/bin:/Users/gkatsevman/p/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

    export JSDEV=/Users/gkatsevman/work/sandbox/little-endians/experience/js
    export ORIGIN=/Users/gkatsevman/work/sandbox/little-endians/origin

    export CLASSPATH=.:/Users/gkatsevman/work/IdeaProjects/Algorithms/lib:$CLASSPATH

    launchctl setenv PATH $PATH
    launchctl setenv JSDEV $JSDEV
    launchctl setenv ORIGIN $ORIGIN
    launchctl setenv CLASSPATH $CLASSPATH

fi

