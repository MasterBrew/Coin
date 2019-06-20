#!/bin/bash

VERSION="\t\t\t Installing Bitcore [BTX] Wallet"

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

clear
printf "\n"
printf "${BPurple}###############################################################################${NC}\n"
printf "${BWhite}$VERSION${NC}\n"
printf "${BPurple}###############################################################################${NC}\n\n"

printf "\t${BYellow}First things first and than the rest get ready for the ride....${NC}\n\n"

# For the fun we  show a count down...
printf "\t\t\t "
for (( counter=10; counter>=0; counter-- ))
do
echo -n "$counter "
sleep .1
done
printf "\n\n"

# Sleep for .5 seconds
sleep .5

# Logging fase 5 for later analizing comping time and state..   
var1=`date`
echo "Start fase 5 : $var1 - Starting with starting swap-file" > fase5.log

# Start swapfile
sudo /etc/init.d/dphys-swapfile start
printf "\n"
# Show free memory
free
printf "\n${Red}Check  swapfile=1024 if not okey?!  use 'sudo nano /etc/dphys-swapfile'${NC}\n"

sleep 1
# Use this to change the size of swapfile if not correct!
# sudo nano /etc/dphys-swapfile

var2=`date`
echo "Start fase 5 : $var2 - Installing Git  " >> fase5.log

NEXT_STEP="Installing Git"
printf "\n"
printf "${Purple}###############################################################################${NC}\n"
printf "${BWhite}  \t\t\t\t $NEXT_STEP     ${NC}\n"
printf "${Purple}###############################################################################${NC}\n\n"
sudo apt-get install git

var3=`date`
echo "Start fase 5 : $var3 - Making ~/wallets directory" >> fase5.log

NEXT_STEP="Creating Directory ~/wallets to install Bitcore source code"
printf "\n"
printf "${Purple}###############################################################################${NC}\n"
printf "${BWhite}\t $NEXT_STEP     ${NC}\n"
printf "${Purple}###############################################################################${NC}\n\n"

# todo   user ask y/n to remove?
printf "Removed old '~/wallets' directory... Done"
rm -rf ~/wallets
printf "\n"
printf "Creating new '~/wallets' directory... Done"
mkdir ~/wallets
cd ~/wallets
printf "\n"

var4=`date`
echo "Start fase 5 : $var3 - Cloning into Git to get BitCore." >> fase5.log

NEXT_STEP="Cloning into Github to get the magic Code "
printf "\n"
printf "${Purple}###############################################################################${NC}\n"
printf "${BWhite}  \t\t $NEXT_STEP     ${NC}\n"
printf "${Purple}###############################################################################${NC}\n\n"

sleep 2
# Git Clone latest sourcecode
git clone https://github.com/LIMXTEC/BitCore

cd BitCore
printf "\n"
ls -l
sleep 5

var5=`date`
echo "Start fase 5 : $var5 - Start ./autogen.sh" >> fase5.log

NEXT_STEP="Please wait ...  ./autogen.sh is running "
printf "\n"
printf "${Purple}###############################################################################${NC}\n"
printf "${White}  \t\t $NEXT_STEP     ${NC}\n"
printf "${Purple}###############################################################################${NC}\n\n"
sleep 2
printf "meditate while it takes some time......\n"
./autogen.sh

var6=`date`
echo "Start fase 5 : $var6 - Start ./configuration" >> fase5.log

NEXT_STEP="Starting ./configuration and its Flaggs!!"
printf "\n"
printf "${Purple}###############################################################################${NC}\n"
printf "${White}  \t\t $NEXT_STEP     ${NC}\n"
printf "${Purple}###############################################################################${NC}\n\n"
sleep 2
./configure  CXXFLAGS="--param ggc-min-expand=1 --param ggc-min-heapsize=32768" CPPFLAGS="-I/usr/local/BerkeleyDB.4.8/include -O" LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib" --disable-tests --disable-bench --enable-upnp-default --with-gui --enable-glibc-back-compat --enable-reduce-exports

var7=`date`
echo "Start fase 5 : $var7 - Start make -j2" >> fase5.log

NEXT_STEP="make -j2 (using 2 proccessors)"
printf "\n"
printf "${Purple}###############################################################################${NC}\n"
printf "${White}  \t\t $NEXT_STEP     ${NC}\n"
printf "${Purple}###############################################################################${NC}\n\n"
sleep 2
make -j2

var8=`date`
echo "Start fase 5 : $var8 - sudo make install" >> fase5.log

NEXT_STEP="Sudo make install => Create the binairies!! SRC "
printf "\n"
printf "${Purple}###############################################################################${NC}\n"
printf "${White}  \t\t $NEXT_STEP     ${NC}\n"
printf "${Purple}###############################################################################${NC}\n\n"
sleep 2
sudo make install

var9=`date`
echo "Start fase 5 : $var9 - Done..." >> fase5.log
echo ''

cat fase5.log

# It ends
printf "\n[END]\n"
sleep .5

# Get Out of her now!
exit 0



