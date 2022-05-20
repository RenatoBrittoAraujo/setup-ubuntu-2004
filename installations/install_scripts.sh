#!/bin/bash
CURR="/home/$(cut -d'/' -f3 <<< $(pwd))/scripts"
GREEN='\033[0;32m'

if [[ ! -d $CURR ]]; then
    mkdir $CURR
fi

OUT_TARGETS="$(find scripts_folder -maxdepth 1 -type f -executable -print 2>/dev/null)"
TARGETS="$(find ../scripts_folder -maxdepth 1 -type f -executable -print 2>/dev/null)"

{
    cp $TARGETS $CURR 2>/dev/null
    printf "===> Scripts installed in ${GREEN}/$(cut -d'/' -f2 <<< $(pwd))/$(cut -d'/' -f3 <<< $(pwd))/scripts\n"
} || {
    cp $OUT_TARGETS $CURR 2>/dev/null
    printf "===> Scripts installed in ${GREEN}/$(cut -d'/' -f2 <<< $(pwd))/$(cut -d'/' -f3 <<< $(pwd))/scripts\n"
} || {
    echo "Could not install scripts!"
}
