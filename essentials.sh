#!/bin/bash

VERSION="0.2.5"

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


echo "##############################################################################" > fase4.log
echo "#                                     Log File                               #" >> fase4.log
echo "##############################################################################" >> fase4.log
echo "" >> fase4.log

var1=`date`
echo "Start Fase 4  : $var1 - Start getting Bitcore Essentials & dependencies " >> fase4.log

sysmem=`/opt/vc/bin/vcgencmd get_mem arm  | sed "s/[A-Za-z]*//g" | cut -c 2-`
gpumem=`/opt/vc/bin/vcgencmd get_mem gpu  | sed "s/[A-Za-z]*//g" | cut -c 2-`
totalmem=`expr $sysmem + $gpumem`

# Model A shouldnt have the smsc95xx installed! Return 1 if its a modelB
modelB=`lsusb -t | grep -c smsc95xx`
rpiSerialNum=`grep Serial /proc/cpuinfo | cut -d " " -f 2`

#Clear the screen to preform the show
clear

printf "\n"
printf "${BPurple}###############################################################################\n"
printf "#${BWhite}                Start getting Bitcore Essentials & Dependencies              ${BPurple}#\n"
printf "###############################################################################\n"
printf "${NC}\n"
printf "${BCyan}                   Starting Fase4  @ $var1\n"
printf "${NC}\n"

if [ "$modelB" = "1" ]
then
  printf "${White}              Raspberry Pi Model B   -   serial: $rpiSerialNum\n"
  printf "\n"
  printf "${BBlue}                    Memory detected: $totalmem MB ($sysmem Sys/$gpumem GPU)${NC}\n"
else
  
  printf "${White}              Raspberry Pi Model A   -   serial: $rpiSerialNum\n"
  printf "\n"
  printf "${BBlue}                    Memory detected: $totalmem MB ($sysmem Sys/$gpumem GPU)${NC}\n"
fi

if free | awk '/^Swap:/ {exit !$2}'; then

       printf "${BGreen} Swap Memory file found!.\n\n"
       free -m
       printf "${NC}"

else
    printf "\n"
    printf "${BRed}                     *  Swap File Settings Not Correct!  *\n"
    printf "${NC}\n"
    printf "\n"
    printf "          Use 'sudo nano /etc/dphys-swapfile' ->  CONF_SWAPSIZE=1024 "
    printf "              'sudo /etc/init.d/dphys-swapfile stop'"
    printf "              'sudo /etc/init.d/dphys-swapfile start'"

    printf "\n\n"

    exit 1

fi

printf "${BYellow}\n"
vcgencmd measure_temp
printf "${NC}\n"

sleep 1.5

#  Onley run when GPU Memory setting is as low as possible ..
if [ "$gpumem" = "16" ]
then
  sleep .5
  #printf "                 GPU_MEMORY = 16 MB\n"
else

  printf "${BRed}\n\n"
  printf "      GPU Memory to high {$gpumem MB}. Use 'sudo raspi-config' to set to 16 Mb\n\n"
  printf "      7. Advanced Options -> A3. Memory Split ->  16 Mb\n\n"
  printf "${NC}\n\n"
  exit 1
fi

#printf "\n"
#printf "\n${BWhite}"
#read -n 1 -s -r -p "                         *  Press any key to begin  *"
#printf "\n${NC}"

  var2=`date`
  echo "Start Fase 4  : $var1 - 'sudo /etc/init.d/dphys-swapfile start'" >> fase4.log
  #sudo /etc/init.d/dphys-swapfile start


# Check it Berkeley DB is installed???

printf "\n\n"
printf "${White}##############################################################################${NC}\n"
printf "${White}#${BWhite}         Berkeley DB 4.8.30 4.8.x    (only needed when wallet enabled)      ${White}#${NC}\n"
printf "${White}##############################################################################${NC}\n"
printf "\n\n"
printf "${BYellow}\n"
printf "      - Already installed in fase3 if you did follow the yellowbrick road"
printf "${NC}\n\n"

sleep 1.5
#read -n 1 -s -r -p "                       *  Press any key to begin  *"

printf "\n\n"
printf "${White}##############################################################################${NC}\n"
printf "${White}#${BWhite}         Boost Library  1.62.0   Algorithms, Function objects and          ${White} #${NC}\n"
printf "${White}#${BWhite}         higher-order  programming, Memory, Miscellaneous and Idioms       ${White} #${NC}\n"
printf "${White}##############################################################################${NC}\n"
printf "\n\n"

  var3=`date`
  echo "Start Fase 4  : $var3 - Installing Boost Librarys." >> fase4.log

sudo apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libboost-program-options-dev


sleep 1.5
#read -n 1 -s -r -p "                       *  Press any key to begin  *"


printf "\n\n"
printf "${White}##############################################################################${NC}\n"
printf "${White}#${BWhite}               ZMQ dependencies  - provides ZeroMessageQ API 4.            ${White} #${NC}\n"
printf "${White}##############################################################################${NC}\n"
printf "\n\n"

#read -n 1 -s -r -p "                       *  Press any key to begin  *"
sudo apt-get install -y libzmq3-dev
sleep 1.5

echo ''
echo '###############################################################################'
echo '#    QT5 GUI Toolskit     (onley needed it only needed when GUI enabled)      #'
echo '###############################################################################'
echo ''


  var5=`date`
  echo "Start Fase 4  : $var5 - QT5 GUI Toolskit     (onley needed it only needed when GUI enabled)" >> fase4.log

sudo apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools
sleep .5

echo ''
echo '###############################################################################'
echo '#   Build-essentials      Contains gcc compiler, make tool, etc for           #'
echo '#                         compiling/building software from source.            #'
echo '###############################################################################'
echo ''

  var6=`date`
  echo "Start Fase 4  : $var6 - Build-essensials" >> fase4.log

sudo apt-get install -y  build-essential
sleep .5

echo ''
echo '###############################################################################'
echo '#   Libtool       GNU Libtool is a computer programming tool from the GNU     #'
echo '#                 build system used for creating portable compiled libraries. #'
echo '###############################################################################'
echo ''


  var7=`date`
  echo "Start Fase 4  : $var7 - Libtools GNU" >> fase4.log

sudo apt-get install -y  libtool
sleep .5

echo ''
echo '###############################################################################'
echo '#   Autotools-dev         GNU Automake and Autoconf Tools.                    #'
echo '###############################################################################'
echo ''


  var8=`date`
  echo "Start Fase 4  : $var8 - Autotools-dev" >> fase4.log

sudo apt-get install -y autotools-dev automake
sleep 0.5

echo ''
echo '###############################################################################'
echo '#   qrencode 3.4.4        Optional for generating QR codes.                   #'
echo '#                         (only needed when GUI enabled)                      #'
echo '###############################################################################'
echo ''


  var9=`date`
  echo "Start Fase 4  : $var9 - qenrencode Optional for QR codes" >> fase4.log

sudo apt-get install -y libqrencode-dev
sleep .5

echo ''
echo '###############################################################################'
echo '#   Protobuf        Data interchange format used for payment protocol.        #'
echo '#                  (only needed when GUI enabled)                             #'
echo '###############################################################################'
echo ''


  var10=`date`
  echo "Start Fase 4  : $var10 - Protobuf Data interchange payment protocol format." >> fase4.log

sudo apt-get install -y libprotobuf-dev protobuf-compiler 
sleep .5

echo ''
echo '###############################################################################'
echo '#   pkg-config     Program that provides a unified interface for querying     #'
echo '#                  installed libraries for the purpose of compiling software  #'  
echo '#                  from its source code.                                      #'
echo '###############################################################################'
echo ''

var11=`date`
  echo "Start Fase 4  : $var11 - Pkg-config." >> fase4.log

sudo apt-get install -y  pkg-config
sleep .5

echo ''
echo '###############################################################################'
echo '#  At-spi2-core    Assistive Technology Service Provider Interface is a       #'
echo '#                  platform-neutral framework for providing bi-directional    #'
echo '#                  communication between assistive technologies (AT)          #'
echo '#                  and applications.                                          #'
echo '###############################################################################'
echo ''

var12=`date`
  echo "Start Fase 4  : $var12 - At-spi2-core." >> fase4.log

sudo apt-get install -y  at-spi2-core 
sleep .5

echo ''
echo '###############################################################################'
echo '#   bsdmainutils    Collection of more utilities from FreeBSD.                #'
echo '#                   This package contains lots of small programs many         #'
echo '#                   people expect to find when they use a BSD-style           #'
echo '#                   Unix system.                                              #'
echo '###############################################################################'
echo ''

var13=`date`
  echo "Start Fase 4  : $var13 - Bsdmainutils." >> fase4.log


sudo apt-get install -y  bsdmainutils
sleep .5

echo ''
echo '###############################################################################'
echo '#   libevent-dev     Library that provides asynchronous event notification.   #'
echo '###############################################################################'
echo ''


var13=`date`
  echo "Start Fase 4  : $var13 - Libevent." >> fase4.log

sudo apt-get install -y  libevent-dev
sleep .5

echo ''
echo '###############################################################################'
echo '#   Libssl-dev       Libssl is the portion of OpenSSL which supports TLS      #'
echo '#                    (SSL and TLS Protocols), and depends on libcrypto.       #'
echo '###############################################################################'
echo ''


var14=`date`
echo "Start Fase 4  : $var14 - Libssl-Dev." >> fase4.log

sudo apt-get install -y  libssl-dev
sleep .5

echo ''
echo '###############################################################################'
echo '#   Libminiupnpc-dev  UPnP IGD client lightweight library and UPnP IGD daemon #'                                                      #'
echo '###############################################################################'
echo ''

var15=`date`
echo "Start Fase 4  : $var15 - Libminiupnpc-dev" >> fase4.log

sudo apt-get install -y  libminiupnpc-dev
sleep .5

echo ''
echo '###############################################################################'
echo '#   Python3        Python is an interpreted high-level programming language   #'
echo '#                  for general-purpose programming.                           #'
echo '###############################################################################'
echo ''

var16=`date`
echo "Start Fase 4  : $var16 - Python3" >> fase4.log

sudo apt-get install -y  python3
sleep .5

echo ''
echo ''
echo '           *  Done... Getting close to world domination? '
sleep 3


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


var17=`date`
echo "Start Fase 4  : $var17 - Done...." >> fase4.log
echo ''
cat fase4.log
echo ''
