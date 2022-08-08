alias ls='ls --color=auto'

platform=`uname -a|awk '{print $2}'|sed 's/\([^0-9]*\).*/\1/'`
if [ $platform = 'cori' ]; then
    alias zja='squeue |rg zja'
fi
