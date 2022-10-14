alias py="python3"
alias yp="python3"
alias python="python3"

system=`uname -a|awk '{print $1}'`
if [ $system = 'Darwin' ]; then
    alias c="pbcopy"
    alias wolfram='/Applications/Mathematica.app/Contents/MacOS/MathKernel'
    alias g++='g++-12'
    alias h5g++='g++-12 -I/opt/homebrew/Cellar/open-mpi/4.1.4_1/include -L/opt/homebrew/Cellar/open-mpi/4.1.4_1/lib -L/opt/homebrew/opt/libevent/lib -lmpi  -I/opt/homebrew/opt/libaec/include -L/opt/homebrew/Cellar/hdf5-mpi/1.12.2/lib /opt/homebrew/Cellar/hdf5-mpi/1.12.2/lib/libhdf5_hl.a /opt/homebrew/Cellar/hdf5-mpi/1.12.2/lib/libhdf5.a -L/opt/homebrew/opt/libaec/lib -lsz -lz -ldl -lm'    
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="/Users/zja/bin:$PATH"
    export PATH="/Users/zja/pbin:$PATH"
    #export PATH=/Users/zja/opt/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH
    #export PATH="/Users/zja/usr/local/bin/:$PATH"
    export LDFLAGS="-L/opt/homebrew/opt/lapack/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/lapack/include"
    export CXX='/opt/homebrew/bin/g++-12'
    # let's use GNU stuff
    export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
    export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
    export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH" 
    # python
    alias pip='pip3'
    export PYTHONPATH="$HOME/utilities/:$PYTHONPATH"
fi

if [ $system = 'Linux' ]; then
    export PATH="$HOME/.local/bin:$PATH" 
    alias e='emacsclient --create-frame'
    alias python='python3.10'
    alias python3='python3.10'    
    alias kill-emacs="emacsclient -e '(kill-emacs)'"
    platform=`uname -a|awk '{print $2}'|sed 's/\([^0-9]*\).*/\1/'`
    if [ $platform = 'cori' ]; then
	alias ls='ls --color=auto'
	alias zja='squeue |rg zja'
    fi
fi
