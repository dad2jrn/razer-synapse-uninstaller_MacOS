#!/bin/bash
# ------------------------------------------------------------------
# Author: Ron Meck
# Version: 0.2.3
#               Razer Synapse 2 Uninstaller
#          Description: This script uninsalls the Razer Synapse 2 
#                       Application from MacOs systems. 
# License: MIT License  
# ------------------------------------------------------------------


# Begin script:
clear
echo " "
echo -e "This script will reboot your system upon completion.\nPlease make sure you have saved anything you\nare working on before hitting any key to continue."
echo " "
read -n 1 -s -r -p "Press any key to continue..."
echo "..."
echo "Working on removing Razer Synapse from your system..."

# Stop blah blah services
launchctl stop "RzDeviceEngine"
launchctl stop "RzUpdater"

# Remove all launch agents
launchctl remove com.razer.rzupdater
launchctl remove com.razerzone.rzdeviceengine

# Remove the LaunchAgents pList files
sudo rm -f /Library/LaunchAgents/com.razer.rzupdater.plist
sudo rm -f /Library/LaunchAgents/com.razerzone.rzdeviceengine.plist

# Remove kernel extension
sudo rm -Rf /System/Library/Extensions/RazerHid.kext

# Delete Razer files from "Application Support" folders:
sudo rm -rf /Library/Application\ Support/Razer
rm -rf ~/Library/Application\ Support/Razer

# Delete Synapse app from /Applications
sudo rm -rf /Library/Application\ Support/Razer

# Begin reboot process
echo " "
echo -e "Looks like everything went smoothly...\nYour system will REBOOT in 60 seconds!"
echo " "

# Present dialog window with countdown and allow user to cancel...
osascript -e 'tell app "loginwindow" to «event aevtrsdn»'