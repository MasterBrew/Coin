#!/bin/bash

# Define ASCII  Colors.
NC='\033[0m'              # Text Reset
White='\033[0;37m'        # White
BWhite='\033[1;37m'       # Bright White
Purple='\033[0;35m'       # Purple
BPurple='\033[1;95m'      # Bright Purple
BCyan='\033[1;36m'        # Cyan
Red='\033[0;31m'          # Red
BRed='\033[1;31m'         # Bright Red
Blue='\033[0;34m'         # Blue
BBlue='\033[1;34m'        # Bright Blue
Green='\033[0;32m'        # Green
BGreen='\033[1;32m'       # Bright Green
Yellow='\033[0;33m'       # Yellow
BYellow='\033[1;33m'      # BYellow


# Check if a Swap drivee is available
if free | awk '/^Swap:/ {exit !$2}'; then

       printf "${BGreen}Green Light for installing!\n\n"
       free -m
       printf "${NC}"

else

    echo "Use 'sudo nano /etc/dphys-swapfile' ->  CONF_SWAPSIZE=1024 "
    exit 1

fi
