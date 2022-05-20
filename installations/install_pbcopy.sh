#!/bin/bash

sudo apt install xclip xsel -y &> /dev/null
echo "alias pbcopy='xclip -selection clipboard'" >> ~/.bashrc
echo "alias pbpaste='xclip -selection clipboard -o'" >> ~/.bashrc
source ~/.bashrc