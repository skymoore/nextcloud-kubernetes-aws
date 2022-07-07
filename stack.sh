#!/bin/bash
# set -x
# apply | create | delete

command=$1
stack=$2


stacks=($(find . -type d -maxdepth 1 -not -path './.*' -exec basename {} \;))

if [[ " ${stacks[*]} " =~ " $stack " ]];then
    echo "$command stack $stack"
else
    echo "no such stack $stack"
    exit 1
fi

# yml files starting with 4 digit number and an underscore
files=($(ls -d -- $stack/[0-9][0-9][0-9][0-9]_*.yml))

case $command in
    apply)
        for file in ${files[@]};do
            kubectl $command -f $file
        done;;
    create)
        for file in ${files[@]};do
            kubectl $command -f $file --save-config
        done;;
    delete)
        for (( idx=${#files[@]}-1 ; idx>=0 ; idx-- ));do
            kubectl $command -f "${files[idx]}"
        done;;
    *)
        echo "$command is not a valid command";;
esac