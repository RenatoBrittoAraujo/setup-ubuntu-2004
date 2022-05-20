#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]
then
    echo "usage: ./setup_signed_commits.sh [key password] [target email]"
else
    sudo apt install xclip xsel -y &> /dev/null
    gpg --default-new-key-algo rsa4096 --quick-generate-key --batch --passphrase "$1" "Renato Britto <$2>"  &> /dev/null
    echo "Your PGP key has been created"
    git config --global user.signingkey $2  &> /dev/null
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
