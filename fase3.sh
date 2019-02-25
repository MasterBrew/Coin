#!/bin/bash

clear echo ' '
echo '###############################################################################'
echo '#                   Step 3 : Getting Essentials  for Bitcore                  #'
echo '###############################################################################'
echo ''
#read -n 1 -s -r -p " * Press key to get essensials for a bitcoin *"

echo ''
echo ''
echo ' Dont forget to check the swapfile = 1024!'
echo ''
echo ' If not okey use "sudo nano /etc/dphys-swapfile"'
echo '' 
sleep 2
#sudo nano /etc/dphys-swapfile

echo ''
echo ''
sudo /etc/init.d/dphys-swapfile start
echo ''
echo ''
free -m
echo ''
echo ''
sleep 3
#read -n 1 -s -r -p "         -  Did the swapfile size show correctly? "
echo '           -  Did it look okey to you?'
echo ''
echo ''
echo '###############################################################################'
echo '#        Install Berkeley database 4.8, then build the BerkeleyDB             #'
echo '###############################################################################'
echo ''

mkdir ~/bin
cd ~/bin

wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz

tar -xzvf db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/build_unix/
../dist/configure --enable-cxx

echo ""
echo ""
#read -n 1 -s -r -p "           * Done downloading, press key to start 'make -j2'  *"
echo '           *  Starting "make -j2" to build Berkely Database'
make -j2
echo ''
echo ''
#read -n 1 -s -r -p "           * Press key to start 'sudo  make install'  *"
echo '           - Running "sudo make install" to finish bakking this piece of art..  '
echo ''
echo ''
sudo make install
echo ''
echo ''
echo 'Berkely DB 4.8.0. Installation done'
echo ''
