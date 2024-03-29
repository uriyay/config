function cd_func()
{
    path=""
    if [ "$*" = "-" ]; then
        popd 2>/dev/null 1>&2
    else    
        if [ -z "$1" ]; then
            path="$HOME"
        else
            path="$*"
        fi

        path_real=$(realpath "$path")
        if [ "$PWD" != "$path_real" ]; then
            pushd "$path_real" 2>/dev/null 1>&2
        fi
    fi
}
alias cd=cd_func

function mkcd_func()
{
    mkdir $1 && cd $_
}
alias mkcd=mkcd_func

function up_func()
{
    path="./"
    level=$1
    if [ -z "$level" ]; then
        level=1
    fi
    for ((i=0; i<$level; i++)); do
        path+="../"
    done
    cd $path
}
alias up=up_func

#wsl-stuff
if [ ! -z "$(cat /proc/version | grep -io microsoft)" ]; then
    alias here="cmd.exe /c start explorer ."
    alias cmd="cmd.exe /c start cmd"
fi

alias print-ip="hostname -I"
