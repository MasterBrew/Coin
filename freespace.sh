#!/bin/bash

VERSION="0.1.2"

clear
echo "##############################################################################" > fase2.log
echo "#                                     Log File                               #" >> fase2.log
echo "##############################################################################" >> fase2.log
echo "" >> fase2.log

  var1=`date`
  echo "Start Fase 2  : $var1 - Start removing unused applications." >> fase2.log

#sudo rm -R /home/pi/python_games

clear
echo ''
echo '###############################################################################'
echo '#        Step 2 : Remove Applications to make space for Blockchain Data.      #'
echo '###############################################################################'
echo ''
#read -n 1 -s -r -p "           *  Press key to start remove ............  *"
echo ''
echo '           *  - Removing Sense-Hat  *'
echo '' 
#sleep 1

sudo apt-get remove -y --purge sense-*

echo ''
echo '           *  - Removing Pulse audio  *'
echo '' 
#sleep 1
sudo apt-get remove -- purge "pulseaudio*"

echo ''
echo '           *  - Removing Libre Office *'
echo '' 
#sleep 1
sudo apt-get remove -y --purge "libreoffice*" 

echo ''
echo '           *  - Removing Wolfram-engine  *'
echo ''
#sleep 1
sudo apt-get -y purge "wolfram-engine"

echo ''
echo '           *  - Removing Sonic-Pi audio  *'
echo '' 
#sleep 1
sudo apt-get remove -y --purge "sonic-pi"

echo ''
echo '           *  - Removing Geany  *'
echo '' 
#sleep 1
sudo apt-get remove -y --purge "geany*"

echo ''
echo '           *  - Removing Scratch  *'
echo '' 
sleep 1
sudo apt-get remove -y --purge "scratch*"

echo ''
echo '           *  - Removing MineCraft-Pi  *'
echo '' 
#sleep 1
sudo apt-get remove -y --purge "minecraft-pi*"

echo ''
echo '           *  - Removing BlueJ  *'
echo '' 
#sleep 1
sudo apt-get remove -y --purge "bluej"

echo ''
echo '           *  - Removing Greenfoot  *'
echo '' 
#sleep 1
sudo apt-get remove -y --purge "greenfoot"

echo ''
echo '           *  - Removing NodeRed  *'
echo '' 
sleep 1
sudo apt-get remove -y --purge "nodered"

echo ''
echo '           *  - Removing Claws-mail  *'
echo '' 
sleep 1
sudo apt-get remove -y --purge "claws-mail*"

echo ''
echo '           *  - Removing Python-pygames  *'
echo '' 
sleep 1
sudo apt-get remove -y --purge "python-pygame"

echo ''
echo '           *  - Removing Thonny Python  *'
echo '' 
sleep 1

sudo apt-get -y remove python3-thonny


echo ''
echo ''
df -H
echo ''
echo ''
#read -n 1 -s -r -p "           *  Press key to clean last part..  *"
echo ''
echo ''
echo '           *  running "sudo apt autoremove" & "sudo apt-get clean"'  
echo ''
echo ''
sudo apt-get clean
sudo apt autoremove -y
echo ''
echo ''
free -m

echo ''
echo ''
echo ''

  var2=`date`
  echo "Start Fase 2  : $var2 -Done ... Cleaning." >> fase2.log
echo '           *  Done..    Please reboot sytem!  *'
echo ''
echo ''
cat fase2.log
