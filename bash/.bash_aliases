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

        path_real=$(realpath $path)
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
    for ((i=0; i<$1; i++)); do
        path+="../"
    done
    cd $path
}
alias up=up_func
