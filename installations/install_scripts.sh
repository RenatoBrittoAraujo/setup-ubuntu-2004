#!/bin/bash
CURR="/home/$(cut -d'/' -f3 <<< $(pwd))/scripts"

echo $CURR

if [[ ! -d $CURR ]]; then
    mkdir $CURR
fi

TARGETS="$(find .. -maxdepth 1 -type f -executable -print)"

cp $TARGETS $CURR