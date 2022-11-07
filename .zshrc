system=`uname -a|awk '{print $1}'`

oh-my-zsh()
{
    export ZSH="$HOME/.oh-my-zsh"
    ZSH_THEME="robbyrussell"
    plugins=(git)
    source $ZSH/oh-my-zsh.sh
}

if [ $system = 'Darwin' ]; then
    oh-my-zsh
    # use autojump
    [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
    autoload -U compinit && compinit

    # alias
    alias rm='rm -i'
    alias sz="source ~/.zshrc"
    alias nersc="ssh -i ~/.ssh/nersc nersc"
    alias e="emacsclient --create-frame -F \"'(fullscreen . maximized)\""

    PROMPT="zja@%{$fg_bold[red]%}mac%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
    PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

    ## python
    alias py="python3 -q" # don't display copyright and version messages
    export PYTHONSTARTUP="$HOME/dotfiles/python/python_startup.py"
    export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/bin/python3
    export WORKON_HOME=$HOME/.virtualenvs
    source "$HOME/Library/Python/3.10/bin/virtualenvwrapper.sh"

    ## homebrew
    alias ibrew='arch -x86_64 /usr/local/bin/brew' # brew hack for x86
    export HOMEBREW_CC=gcc-12
    export HOMEBREW_CXX=g++-12
fi

if [ $system = 'Linux' ]; then
    platform=`uname -a|awk '{print $2}'|sed 's/\([^0-9]*\).*/\1/'`
    if [ $platform = 'cori' ]; then
	alias ls='ls --color=auto'
	module swap craype-haswell craype-mic-knl
	module load cray-fftw
    elif [ $platform = 'login' ]; then
	alias ls='ls --color=auto'
        export PATH="$HOME/local/perlmutter/bin:$PATH"
    else
	# zja local machine
	PROMPT="zja@%{$fg_bold[red]%}ubuntu%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
	PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
        oh-my-zsh
    fi
    if ! ps -e -o args | grep -q '^emacs --daemon$'; then
	emacs --daemon
    else
	echo "Emacs server has been started"
    fi
fi

alias qe='cd ~/research/q-e-debug'
export PATH="$HOME/utilities/qe_helper:$PATH"
