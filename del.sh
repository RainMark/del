#!/bin/bash

VERSION=0.1
AUTHOR=RainMark

is_dot_file()
{
        # echo $1 $2
        if [ -z "`echo $1 | awk -F '.' '{print $1}'`" ]; then
                return 1
        else
                return 0
        fi
}

main()
{
        # TODO
        # How to solve multi flags? such as: del * , del 123 fff 333 1.c
        is_dot_file $*
        ret=$?
        if [ "1" == "$ret" ]; then
                #echo "dot file!"
                echo "Maybe you want rm $1 ? <yes/no>:NO."
                read ans
                # echo $ans
                case $ans in
                        yes | YES | ye | y | Y ) echo "Deleted!";; #rm -rf $1 ;;
                esac
        else
                # echo "normal file!"
                mv "$1" ".$1"
        fi
}

main $*