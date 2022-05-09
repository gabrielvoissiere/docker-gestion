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
    echo "$(tput setaf 3)Hello ! I am your personnal docker quick commands assistant$(tput setaf 7)"
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
    clear
    titre
    echo "Building project ..."
    echo "$(tput setaf 4)"
    docker compose up -d --build
    wait
    echo "$(tput setaf 7)"
    echo "Project Build !"s
}

function stop {
    clear
    titre
    echo "Stopping the project"
    echo "$(tput setaf 4)"
    docker kill $(docker ps -q)
    wait
    echo "$(tput setaf 47)"
    echo "Project stopped properly !"
}

function start {
    clear
    titre
    echo "Strating project ..."
    echo "$(tput setaf 4)"
    docker compose up -d
    wait
    echo "$(tput setaf 7)"
    echo "Project started !"
}

function full-rebuild {
    clear
    titre
    echo "Are you sure to full rebuild all the project ?"
    echo "$(tput setaf 1)This action is permanent, be sure to save all your changes !$(tput setaf 7)"
    echo ""
    read -p "$(tput setaf 4)yes/no : $(tput setaf 7)" confirmation

    if [[ $confirmation == "yes" ]]; then
        echo ""
        echo "Stop docker and removing the containers ..."
        echo "$(tput setaf 4)"
        docker compose down
        wait
        echo "$(tput setaf 7)"
        echo "Finished, rebuilding the project..."
        echo "$(tput setaf 4)"
        docker compose up -d --build
        wait
        echo "$(tput setaf 7)"
        echo "Project full rebuilded !"
    else
        clear
    fi
}

function reload {
    clear
    titre
    echo "Stopping the project"
    echo "$(tput setaf 4)"
    docker kill $(docker ps -q)
    wait
    echo "$(tput setaf 47)"
    echo "Project stopped properly !"
    echo ""
    echo "Strating project ..."
    echo "$(tput setaf 4)"
    docker compose up -d
    wait
    echo "$(tput setaf 7)"
    echo "Project reloaded !"
}

function rebuild {
    clear
    titre
    echo "Stopping the project"
    echo "$(tput setaf 4)"
    docker kill $(docker ps -q)
    wait
    echo "$(tput setaf 47)"
    echo "Project stopped properly !"
    echo ""
    echo "Strating project ..."
    echo "$(tput setaf 4)"
    docker compose up -d --build
    wait
    echo "$(tput setaf 7)"
    echo "Project rebuilded !"
}

# switch for commands
if [[ $1 == "help" ]]; then
    clear
    presentation
elif [[ $1 == "build" ]]; then
    clear
    build
elif [[ $1 == "start" ]]; then
    clear
    start
elif [[ $1 == "stop" ]]; then
    clear
    stop
elif [[ $1 == "reload" ]]; then
    clear
    reload
elif [[ $1 == "rebuild" ]]; then
    clear
    rebuild
elif [[ $1 == "full-rebuild" ]]; then
    clear
    full-rebuild
else
    clear
    titre
    echo "oops... error... type 'help' to see the available commands"
fi
