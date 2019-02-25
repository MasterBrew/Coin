#!/bin/bash


if free | awk '/^Swap:/ {exit !$2}'; then

       printf "${BGreen}Green Light for installing!\n\n"
       free -m
       printf "${NC}"

else

    echo "Use 'sudo nano /etc/dphys-swapfile' ->  CONF_SWAPSIZE=1024 "
    exit 1

fi





