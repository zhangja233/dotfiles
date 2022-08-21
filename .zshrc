alias ls='ls --color=auto'

platform=`uname -a|awk '{print $2}'|sed 's/\([^0-9]*\).*/\1/'`
if [ $platform = 'cori' ]; then
    if ! ps -e -o args | grep -q '^emacs --daemon$'; then  
	emacs --daemon
    else  
	echo "Emacs server has been started" 
    fi
    alias zja='squeue |rg zja'
    alias e='emacsclient --create-frame'
    alias python='python3.10'
    alias python3='python3.10'
    alias kill-emacs="emacsclient -e '(kill-emacs)'"
fi

