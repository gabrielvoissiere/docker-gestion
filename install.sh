echo "$(tput setaf 2)  _____    ____    _____    ______   _        _        _____    _____ "
echo "$(tput setaf 2) / ____|  / __ \  |  __ \  |  ____| | |      | |      |_   _|  / ____|"
echo "$(tput setaf 2)| |      | |  | | | |__) | | |__    | |      | |        | |   | (___  "
echo "$(tput setaf 2)| |      | |  | | |  _  /  |  __|   | |      | |        | |    \___ \ "
echo "$(tput setaf 2)| |____  | |__| | | | \ \  | |____  | |____  | |____   _| |_   ____) |"
echo "$(tput setaf 2) \_____|  \____/  |_|  \_\ |______| |______| |______| |_____| |_____/ "
echo ""
echo "----------------------------------------------------------------------$(tput setaf 7)"
echo ""
echo "installing dockis on your computer (mac only) ..."
echo ""

# move dockis to /usr/local/bin
mv dockis /usr/local/bin

# do to /usr/local/bin/
cd /usr/local/bin

# make dockis executable
chmod +x dockis

echo ""
echo "dockis installed successfully"