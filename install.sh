#!/bin/bash
clear
echo "$(tput setaf 2)  _____    ____    _____    ______   _        _        _____    _____ "
echo "$(tput setaf 2) / ____|  / __ \  |  __ \  |  ____| | |      | |      |_   _|  / ____|"
echo "$(tput setaf 2)| |      | |  | | | |__) | | |__    | |      | |        | |   | (___  "
echo "$(tput setaf 2)| |      | |  | | |  _  /  |  __|   | |      | |        | |    \___ \ "
echo "$(tput setaf 2)| |____  | |__| | | | \ \  | |____  | |____  | |____   _| |_   ____) |"
echo "$(tput setaf 2) \_____|  \____/  |_|  \_\ |______| |______| |______| |_____| |_____/ "
echo ""
echo "----------------------------------------------------------------------$(tput setaf 7)"
echo ""

User=$1

function macOs {
    echo ""
    echo "installing dockis on your computer (mac only) ..."

    echo ""

    # create hidden dockis folder
    mkdir /Users/"$User"/.dockis
    mkdir /Users/"$User"/.dockis/dockis

    # copy dockis and dockis-upgrade in hidden dockis folder
    cp dockis /Users/"$User"/.dockis/dockis
    cp dockis-upgrade-macos /Users/"$User"/.dockis

    # rename in dockis-upgrade
    cd /Users/"$User"/.dockis
    mv dockis-upgrade-macos dockis-upgrade

    # copy dockis and dockis-upgrade in /usr/local/bin/
    cp dockis /usr/local/bin
    cp dockis-upgrade-macos /usr/local/bin

    # make dockis executable
    cd /usr/local/bin/
    mv dockis-upgrade-macos dockis-upgrade
    chmod +x dockis
    chmod +x dockis-upgrade

    echo ""
    echo "dockis installed successfully ! You may now delete this folder"
    echo ""
    echo "Type 'dockis help' to see the list of commands"
}

function linux {
    echo ""
    echo "installing dockis on your computer (linux only) ..."

    echo ""

    # create hidden dockis folder
    mkdir /home/"$User"/.dockis
    mkdir /home/"$User"/.dockis/dockis

    # copy dockis and dockis-upgrade in hidden dockis folder
    cp dockis /home/"$User"/.dockis/dockis
    cp dockis-upgrade-linux /home/"$User"/.dockis

    # rename in dockis-upgrade
    cd /home/"$User"/.dockis
    mv dockis-upgrade-linux dockis-upgrade

    # copy dockis and dockis-upgrade in /usr/local/bin/
    cp dockis /usr/local/bin
    cp dockis-upgrade /usr/local/bin

    # make dockis executable
    cd /usr/local/bin/
    mv dockis-upgrade-linux dockis-upgrade
    chmod +x dockis
    chmod +x dockis-upgrade

    echo ""
    echo "dockis installed successfully ! You may now delete this folder"
    echo ""
    echo "Type 'dockis help' to see the list of commands"
}

read -p "Choose your OS (1 - Linux, 2 - MacOS, 3 - Windows) : " os

if [ $os = 1 ]; then
    linux
elif [ $os = 2 ]; then
    macOs
elif [ $os = 3 ]; then
    echo "You can see the readme to know how to install it on Windows."
else
    echo "Wrong os !"
    exit
fi
