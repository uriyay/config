function cd_func()
{
    path=""
    if [ "$1" = "-" ]; then
        popd 2>/dev/null 1>&2
    else    
        if [ -z "$1" ]; then
            path="~/"
        else
            path="$1"
        fi

        if [ "$(realpath $PWD)" != "$(realpath $path)" ]; then
            pushd $1 2>/dev/null 1>&2
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
