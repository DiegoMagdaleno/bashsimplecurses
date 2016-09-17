#!/bin/bash

source ./simple_curses.sh
selected="1"
lastselected="1"
main(){
    local foo1
    local foo2
    window "test" "red" "33%" "blue"
    foo1="black"
    foo2="black"
    case $selected in 
        1)
            foo1="grey"
        ;;
        2)
            foo2="grey"
        ;;
    esac
    append "footext1" "blue" $foo1
    append "exit" "cyan" $foo2
    endwin
    lastselected=$selected
}
update(){
    local ret
    local success
    #read -n 1 -s -t 1 ret
    read -n 1 -s ret 
    success=$?
    [ "$ret" == "^" ] && echo "fub" && read -n 3 -s -t 0 ret
#   echo $ret
#   echo $success
    [ "$success" == "0" ] && selected=$ret
    case $selected in 
        *A)
            selected="1"
        ;;
        *B)
            selected="2"
        ;;
        *C)
            selected="1"
        ;;
        *D)
            selected="2"
        ;;
    esac

    [ "$ret" == "" ] && [ "$lastselected" == "2" ] && return 1

    return 0
}
main_loop update
echo "exited"