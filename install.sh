#!/bin/bash
clear
echo "$(tput setaf 2) _____     ____     _____   _  __  _____    _____ "
echo "$(tput setaf 2)|  __ \   / __ \   / ____| | |/ / |_   _|  / ____|"
echo "$(tput setaf 2)| |  | | | |  | | | |      | ' /    | |   | (___  "
echo "$(tput setaf 2)| |  | | | |  | | | |      |  <     | |    \___ \ "
echo "$(tput setaf 2)| |__| | | |__| | | |____  | . \   _| |_   ____) |"
echo "$(tput setaf 2)|_____/   \____/   \_____| |_|\_\ |_____| |_____/ "
echo ""
echo "-------------------------------------------------$(tput setaf 7)"
echo "$(tput setaf 2)version 1.0$(tput setaf 7)"

# get user argument
User=$1

# install on MacOs
function macOs {
    echo ""
    echo "$(tput setaf 3)installing Dockis on your computer (mac only) ..."
    sleep 2

    echo ""

    echo "create hidden dockis folder"
    sleep 2
    mkdir /Users/"$User"/.dockis
    mkdir /Users/"$User"/.dockis/dockis

    echo "copy dockis and dockis-upgrade in hidden dockis folder"
    sleep 2
    cp dockis /Users/"$User"/.dockis/dockis
    cp dockis-upgrade-macos /Users/"$User"/.dockis

    echo "copy dockis and dockis-upgrade in /usr/local/bin/"
    sleep 2
    cp dockis /usr/local/bin
    cp dockis-upgrade-macos /usr/local/bin

    echo "rename dockis-upgrade"
    sleep 2
    cd /Users/"$User"/.dockis
    mv dockis-upgrade-macos dockis-upgrade

    echo "make dockis executable"
    sleep 2
    cd /usr/local/bin/
    mv dockis-upgrade-macos dockis-upgrade
    chmod +x dockis
    chmod +x dockis-upgrade

    echo ""
    echo "$(tput setaf 2)dockis installed successfully ! You may now delete this folder"
    echo ""
    echo "$(tput setaf 6)Type 'sudo dockis-upgrade \$USER' to be sure you are on the latest version of Dockis"
    echo ""
    echo "T$(tput setaf 7)ype 'dockis help' to see the list of commands"
    echo ""
}

# install on Linux
function linux {
    echo ""
    echo "$(tput setaf 3)installing dockis on your computer (linux only) ..."
    sleep 2

    echo ""

    echo "create hidden dockis folder ..."
    sleep 2
    mkdir /home/"$User"/.dockis
    mkdir /home/"$User"/.dockis/dockis

    echo "copy dockis and dockis-upgrade in hidden dockis folder ..."
    sleep 2
    cp dockis /home/"$User"/.dockis/dockis
    cp dockis-upgrade-linux /home/"$User"/.dockis

    echo "copy dockis and dockis-upgrade in /usr/local/bin/ ..."
    sleep 2
    cp dockis /usr/local/bin
    cp dockis-upgrade-linux /usr/local/bin
    cp dockis-uninstall-linux /usr/local/bin

    echo "rename dockis-upgrade ..."
    sleep 2
    cd /home/"$User"/.dockis
    mv dockis-upgrade-linux dockis-upgrade

    echo "make dockis executable ..."
    sleep 2
    cd /usr/local/bin/
    mv dockis-upgrade-linux dockis-upgrade
    mv dockis-uninstall-linux dockis-uninstall
    chmod +x dockis
    chmod +x dockis-upgrade
    chmod +x dockis-uninstall

    echo ""
    echo "$(tput setaf 2)dockis installed successfully ! You may now delete this folder"
    echo ""
    echo "$(tput setaf 6)Type 'sudo dockis-upgrade \$USER' to be sure you are on the latest version of Dockis"
    echo ""
    echo "$(tput setaf 7)Type 'dockis help' to see the list of commands"
    echo ""
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
