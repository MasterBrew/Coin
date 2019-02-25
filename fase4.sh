#!/bin/bash
VERSION="0.1.1"

clear
echo "##############################################################################" > fase4.log
echo "#                                     Log File                               #" >> fase4.log
echo "##############################################################################" >> fase4.log
echo "" >> fase4.log

  var1=`date`
  echo "Start Fase 4  : $var1 - Start getting Bitcore Essentials & dependencies " >> fase4.log

clear
echo '                                                                               '
echo '###############################################################################'
echo '#                   Step 4 : Getting Essentials for Bitcore                   #'
echo '###############################################################################'
echo ''
#read -n 1 -s -r -p "           *  Press key to get essensials for a bitcoin  *"
echo ''


  var2=`date`
  echo "Start Fase 4  : $var1 - 'sudo /etc/init.d/dphys-swapfile start'" >> fase4.log

sudo /etc/init.d/dphys-swapfile start
echo ''
echo ''
free -m
echo ''
#read -n 1 -s -r -p "           * Press key to start *"
echo ''
echo '###############################################################################'
echo '#   Berkeley DB 4.8.30 4.8.x   (only needed when wallet enabled) -  fase2.sh  #'
echo '###############################################################################'
echo ''
echo '    - Already installed in fase3 if you did follow the yellowbrick road' 
sleep .2
echo '' 
echo '###############################################################################'
echo '#   Boost Library  1.62.0   Algorithms, Function objects and  higher-order    #'
echo '#                           programming, Memory, Miscellaneous and Idioms     #' 
echo '###############################################################################'
echo ''


  var3=`date`
  echo "Start Fase 4  : $var3 - Installing Boost Librarys." >> fase4.log

sudo apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libboost-program-options-dev

sleep .5

echo ''
echo '###############################################################################'
echo '#   ZMQ dependencies  - provides ZeroMessageQ API 4.x                         #'
echo '###############################################################################'
echo ''


  var4=`date`
  echo "Start Fase 4  : $var4 - ZMQ dependencies - provides ZeroMessageQ API 4.x." >> fase4.log

sudo apt-get install libzmq3-dev
sleep .5

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

var17=`date`
echo "Start Fase 4  : $var17 - Done...." >> fase4.log
echo ''
cat fase4.log
echo ''