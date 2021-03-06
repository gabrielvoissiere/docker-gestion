#!/bin/bash
clear
echo "$(tput setaf 2) _____     ____     _____   _  __  _____    _____ "
echo "$(tput setaf 2)|  __ \   / __ \   / ____| | |/ / |_   _|  / ____|"
echo "$(tput setaf 2)| |  | | | |  | | | |      | ' /    | |   | (___  "
echo "$(tput setaf 2)| |  | | | |  | | | |      |  <     | |    \___ \ "
echo "$(tput setaf 2)| |__| | | |__| | | |____  | . \   _| |_   ____) |"
echo "$(tput setaf 2)|_____/   \____/   \_____| |_|\_\ |_____| |_____/ "
echo ""
echo "--------------------------------------------------$(tput setaf 7)"
echo "$(tput setaf 2)version 1.0$(tput setaf 7)"
echo ""

# get user argument
User=$1
Path=$(pwd)

function delete_installation_folder {
    echo ""
    echo "$(tput setaf 2)Installation folder successfully deleted !"
    rm -rf $Path
}

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

    echo "copy dockis and dockis-upgrade in /usr/local/bin/"
    sleep 2
    cp dockis /usr/local/bin
    cp dockis-upgrade-macos /usr/local/bin
    cp dockis-uninstall-macos /usr/local/bin

    echo "make dockis executable"
    sleep 2
    cd /usr/local/bin/
    mv dockis-upgrade-macos dockis-upgrade
    mv dockis-uninstall-macos dockis-uninstall
    chmod +x dockis
    chmod +x dockis-upgrade
    chmod +x dockis-uninstall

    echo ""
    echo "$(tput setaf 6)upgrading dockis ...$(tput setaf 7)"
    sleep 2
    cd /Users/"$User"/.dockis
    rm -rf dockis
    git clone https://github.com/gabrielvoissiere/dockis.git
    cd dockis
    cp dockis /usr/local/bin

    echo ""
    echo "$(tput setaf 2)dockis installed successfully ! You may now delete this folder"
    echo ""
    echo "$(tput setaf 6)Type 'sudo dockis-upgrade \$USER' to be sure you are on the latest version of Dockis"
    echo ""
    echo "T$(tput setaf 7)ype 'dockis help' to see the list of commands"
    echo ""

    read -p "$(tput setaf 1)Do you want to delete installation fodler now ? (yes/no) : $(tput setaf 7)" delete

    if [ $delete = "yes" ]; then
        delete_installation_folder
    else
        exit
    fi
}

# install on Linux
function linux {
    echo ""
    echo "$(tput setaf 3)installing dockis on your computer (linux only) ..."
    sleep 2

    echo ""

    echo "$(tput setaf 6)create hidden dockis folder ..."
    sleep 2
    mkdir /home/"$User"/.dockis
    mkdir /home/"$User"/.dockis/dockis

    echo "copy dockis and dockis-upgrade in hidden dockis folder ..."
    sleep 2
    cp dockis /home/"$User"/.dockis/dockis

    echo "copy dockis and dockis-upgrade in /usr/local/bin/ ..."
    sleep 2
    cp dockis /usr/local/bin
    cp dockis-upgrade-linux /usr/local/bin
    cp dockis-uninstall-linux /usr/local/bin

    echo "make dockis executable ..."
    sleep 2
    cd /usr/local/bin/
    mv dockis-upgrade-linux dockis-upgrade
    mv dockis-uninstall-linux dockis-uninstall
    chmod +x dockis
    chmod +x dockis-upgrade
    chmod +x dockis-uninstall

    echo ""
    echo "$(tput setaf 3)upgrading dockis ...$(tput setaf 6)"
    echo ""
    sleep 2
    cd /home/"$User"/.dockis
    rm -rf dockis
    git clone https://github.com/gabrielvoissiere/dockis.git
    cd dockis
    cp dockis /usr/local/bin

    echo ""
    echo "$(tput setaf 2)dockis installed and upgraded successfully !"
    echo ""
    echo "$(tput setaf 7)Type 'dockis help' to see the list of commands"
    echo ""

    read -p "$(tput setaf 1)Do you want to delete installation fodler now ? (yes/no) : $(tput setaf 7)" delete

    if [ $delete = "yes" ]; then
        delete_installation_folder
    else
        exit
    fi
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
