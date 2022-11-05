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
    alias e="emacsclient -nw --create-frame -F \"'(fullscreen . maximized)\""

    # brew hack for x86
    alias ibrew='arch -x86_64 /usr/local/bin/brew'

    PROMPT="zja@%{$fg_bold[red]%}mac%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
    PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

    export PYTHONSTARTUP="$HOME/dotfiles/python/python_startup.py"
fi

if [ $system = 'Linux' ]; then
    if ! ps -e -o args | grep -q '^emacs --daemon$'; then  
	emacs --daemon
    else  
	echo "Emacs server has been started" 
    fi
    platform=`uname -a|awk '{print $2}'|sed 's/\([^0-9]*\).*/\1/'`
    if [ $platform = 'cori' ]; then
	alias ls='ls --color=auto'
	module swap craype-haswell craype-mic-knl
	module load cray-fftw
    else
        oh-my-zsh        
    fi
fi

alias qe='cd ~/research/q-e-debug'
