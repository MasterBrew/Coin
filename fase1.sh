#!/bin/bash
VERSION="0.2.1"

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
# Creating Logfile to see time it takes to do the walk..
echo "" > fase1.log
echo "################################################################################" >> fase1.log
echo "#                                       Log File                               #" >> fase1.log
echo "################################################################################" >> fase1.log
echo "" >> fase1.log

var1=`date`
echo "Start Fase 1  : $var1 - Updating The Raspberry" >> fase1.log

sysmem=`/opt/vc/bin/vcgencmd get_mem arm  | sed "s/[A-Za-z]*//g" | cut -c 2-`
gpumem=`/opt/vc/bin/vcgencmd get_mem gpu  | sed "s/[A-Za-z]*//g" | cut -c 2-`
totalmem=`expr $sysmem + $gpumem`

# Model A shouldnt have the smsc95xx installed! Return 1 if its a modelB
modelB=`lsusb -t | grep -c smsc95xx`
rpiSerialNum=`grep Serial /proc/cpuinfo | cut -d " " -f 2`

clear
printf "\n"
printf "${BPurple}###############################################################################\n"
printf "#${BWhite}                      Step 1 : Updating Rasberry Pi Zero !!                  ${BPurple}#\n"
printf "###############################################################################\n"
printf "${NC}\n"

printf "${BCyan}    Start Fase 1  : Updating The Raspberry @ $var1\n"
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

       printf "${BGreen}\n\n"
       free -m
       printf "${NC}"

else

    echo "Use 'sudo nano /etc/dphys-swapfile' ->  CONF_SWAPSIZE=1024 "
    exit 1

fi

printf "${BYellow}\n"
vcgencmd measure_temp
 printf "${NC}\n"

printf "\n"
sleep 3

if [ "$gpumem" = "16" ]
then
  sleep .5
  #printf "                 GPU_MEMORY = 16 MB\n"
else

  printf "${BRed}\n              Memory set to $gpumem MB Use Raspi-config to set to 16 Mb\n"
  printf "${NC}"
  exit 1
fi



printf "\n"
printf "\n${BWhite}"
read -n 1 -s -r -p "                       *  Press any key to begin  *"
printf "\n${NC}"

printf "\n"
printf "${BRed}          *  Updating Raspberry to latest Firmware version  *\n"
printf "${NC}\n"
printf "\n"

sudo apt-get install rpi-update
sudo rpi-update

printf "\n\n${BWhite}         *  Press a key to go one with the walk  *\n"
printf "${BRed}\n"

printf "\n"
read -n 1 -s -r -p "         *  Or ^C to stop script to Reboot if you need  *"
printf "${NC}\n\n"
var2=`date`
echo "Start Fase 1  : $var2 - "sudo apt-get update"" >> fase1.log

printf "\n\n"

printf "${White}###############################################################################\n"
printf "${BWhite}                *  Starting  'sudo apt-get update'  *${NC}\n"
printf "${White}###############################################################################${NC}\n\n"

sudo apt-get update

var3=`date`
echo "Start Fase 1  : $var3 - "sudo apt-get upgrade"" >> fase1.log
printf "\n\n${BWhite}           *  Next 'sudo apt-get upgrade'  *${NC}\n\n"

sudo apt-get upgrade -y

printf "\n${BWhite}             *  Cleaning up the place  *${NC}\n\n"

var4=`date`
echo "Start Fase 1  : $var4 - Cleaning up" >> fase1.log

sudo apt-get remove
sudo apt-get clean

printf "\n${Green}\n###############################################################################\n"
printf "${BGreen}                   *  Done..  Please reboot sytem!!  *\n"
printf "${Green}###############################################################################\n${NC}\n\n"

var5=`date`
echo "Start Fase 1  : $var5 Finished Logging...." >> fase1.log

printf "\n"
cat fase1.log
printf "\n\n"
