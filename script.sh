#!/bin/bash
function titre {
    echo "$(tput setaf 2)  _____    ____    _____    ______   _        _        _____    _____ "
    echo "$(tput setaf 2) / ____|  / __ \  |  __ \  |  ____| | |      | |      |_   _|  / ____|"
    echo "$(tput setaf 2)| |      | |  | | | |__) | | |__    | |      | |        | |   | (___  "
    echo "$(tput setaf 2)| |      | |  | | |  _  /  |  __|   | |      | |        | |    \___ \ "
    echo "$(tput setaf 2)| |____  | |__| | | | \ \  | |____  | |____  | |____   _| |_   ____) |"
    echo "$(tput setaf 2) \_____|  \____/  |_|  \_\ |______| |______| |______| |_____| |_____/ "
    echo ""
    echo "----------------------------------------------------------------------$(tput setaf 7)"
    echo ""
}

function presentation {
    titre
    echo "$(tput setaf 3)Hello ! I am your personnal docker assistant$(tput setaf 7)"
    echo ""
    echo "This is the list of all my commands, ENJOY !"
    echo "$(tput setaf 1)Just make sure you're in the right code folder$(tput setaf 7)"
    echo ""
    echo "- help"
    echo "- build"
    echo "- start"
    echo "- stop"
    echo "- reload"
    echo "- rebuild"
    echo "- full-rebuild (be carefull with this command, you must play)"
    echo ""
}

function build {
    # clear the terminal
    clear
    titre
    echo "Building project"
    echo ""
    docker compose up --build
    wait
    echo ""
    echo "Project Build"
    echo ""
    echo "Starting the project"
}

function full-rebuild {
    # clear the terminal
    clear
    titre
    echo "Are you sure to full rebuild all the project ?"
    echo "$(tput setaf 1)This action is permanent, be sure to save all your changes !$(tput setaf 7)"
    echo ""
    read -p "$(tput setaf 4)yes/no : $(tput setaf 7)" confirmation

    if [[ $confirmation == "yes" ]]; then
        clear
        echo ""
        echo "Stop docker and removing the containers ..."
        echo ""
        docker compose down
        wait
        echo ""
        echo "Finished, rebuilding the project..."
        echo ""
        docker compose up --build
        wait
        echo ""
        echo "Project Build"
        echo ""
        echo "Starting the project"
    else
        clear
    fi
}

# switch for commands
if [[ $1 == "help" ]]; then
    # clear the terminal
    clear
    presentation
elif [[ $1 == "build" ]]; then
    # clear the terminal
    clear
    build
elif [[ $1 == "start" ]]; then
    # clear the terminal
    clear
    echo "start"
elif [[ $1 == "stop" ]]; then
    # clear the terminal
    clear
    stop
elif [[ $1 == "reload" ]]; then
    # clear the terminal
    clear
    echo "reload"
elif [[ $1 == "rebuild" ]]; then
    # clear the terminal
    clear
    echo "rebuild"
elif [[ $1 == "full-rebuild" ]]; then
    # clear the terminal
    clear
    full-rebuild
else
    echo "oops... error... type 'help' to see the available commands"
fi