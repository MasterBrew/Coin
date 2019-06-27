#!/bin/bash

clear echo ' '
echo '###############################################################################'
echo '#                          Setting you swapdrive to 1024                      #'
echo '###############################################################################'
echo ''

echo ''
echo ''
echo ' Dont forget to check the swapfile = 1024!'
echo ''
echo ' If not okey use "sudo nano /etc/dphys-swapfile"'
echo '' 
sleep 2
sudo nano /etc/dphys-swapfile

echo ''
echo ''
sudo /etc/init.d/dphys-swapfile start
echo ''
echo ''
free 
echo ''
echo ''
sleep 3
#read -n 1 -s -r -p "         -  Did the swapfile size show correctly? "
echo '           -  Did it look okey to you?'
echo ''
echo ''
