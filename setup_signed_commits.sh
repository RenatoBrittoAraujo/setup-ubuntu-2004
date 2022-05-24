#!/bin/bash

if [ -z "$1" ]
then
    echo "usage: ./setup_signed_commits.sh [target email] ?[password]"
else
    sudo apt install xclip xsel -y &> /dev/null
    if [ -z "$2" ]
    then 
	gpg --default-new-key-algo rsa4096 --gen-key --passphrase $2 "Renato Britto <$1>" &> /dev/null	
    else    
    	gpg --default-new-key-algo rsa4096 --gen-key "Renato Britto <$1>" &> /dev/null
    fi
    echo "Your PGP key has been created"
    git config --global user.signingkey $1  &> /dev/null
    git config --global commit.gpgsign true  &> /dev/null
    echo "Git has been successfully setup to sign with your key, all your commits should be auto signed now"
    echo ""
    echo "Done :)"
    echo ""
    echo "To sign a commit manually, do 'git commit -a -S -m \"<message>\"'"
    echo "To sign a commit retroactively, do 'git commit -a --no-edit -S <commit hash>'"
    echo ""

    gpg --armor --export $2 | xclip -selection clipboard  &> /dev/null
    echo "Your PGP pubkey has been copied to the clipboard!"
    echo "Visit https://github.com/settings/gpg/new and add it to github"
fi
