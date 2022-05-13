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

function macOs {
    echo ""
    echo "installing dockis on your computer (mac only) ..."

    echo ""

    # create hidden dockis folder
    mkdir /Users/"$1"/.dockis
    mkdir /Users/"$1"/.dockis/dockis

    # copy dockis and dockis-upgrade in hidden dockis folder
    cp dockis /Users/"$1"/.dockis/dockis
    cp dockis-upgrade /Users/"$1"/.dockis

    # copy dockis and dockis-upgrade in /usr/local/bin/
    cp dockis /usr/local/bin
    cp dockis-upgrade /usr/local/bin

    # make dockis executable
    cd /usr/local/bin/
    chmod +x dockis
    chmod +x dockis-upgrade

    echo ""
    echo "upgrading dockis..."
    dockis-upgradewait
    echo "dockis successfully upgraded !"
    echo ""
    echo "dockis installed successfully ! You may now delete this folder"
    echo ""
    echo "Type 'dockis help' to see the list of commands"
}

read -p "Choose your OS (1 - Linux, 2 - MacOS, 3 - Windows) : " os

if [ $os = 1 ]; then
    echo "Linux is not supported yet, but you can add it yourself."
elif [ $os = 2 ]; then
    macOs
elif [ $os = 3 ]; then
    echo "Windows is not supported yet, but you can add it yourself."
else
    echo "You choose wrong"
    exit
fi
