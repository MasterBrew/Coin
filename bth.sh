#!/bin/bash
VERSION="0.1.1"

clear
echo ''
echo '****************************************************************************'
echo '*                        Installing BTH Wallet!                        *'
echo '****************************************************************************'
echo ''

var1=`date`
echo "Start fase 5 : $var1 - Starting with starting swap-file" > fase5.log

sudo /etc/init.d/dphys-swapfile start
echo ''
echo ''
sleep .5

sudo apt-get install libsodium-dev

var2=`date`
echo "Start fase 5 : $var2 - Installing Git  " >> fase5.log

sudo apt-get install git

echo ''
echo '****************************************************************************'
echo '*       Creating Directory ~/wallets to install BTH source code.       *'
echo '****************************************************************************'

var3=`date`
echo "Start fase 5 : $var3 - Making ~/wallets directory" >> fase5.log

echo ''
rm -rf ~/wallets

mkdir ~/wallets
cd ~/wallets

var4=`date`
echo "Start fase 5 : $var3 - Cloning into Git to get BTH." >> fase5.log

git clone https://github.com/BTHPOS/BTH.git

cd BTH

#read -n 1 -s -r -p "           * Press key to start frontend parsing BTH  *"
echo ''
echo ''
echo '****************************************************************************'
echo '*                  Please Wait Wile ./autogen.sh is running                *'
echo '****************************************************************************'
echo ''
echo 'meditate while it takes some time.......'
echo ''

echo 'logging time..'

var5=`date`
echo "Start fase 5 : $var5 - Start ./autogen.sh" >> fase5.log

./autogen.sh

var6=`date`
echo "Start fase 5 : $var6 - Start ./configuration" >> fase5.log

./configure CXXFLAGS="--param ggc-min-expand=1 --param ggc-min-heapsize=32768" CPPFLAGS="-I/usr/local/BerkeleyDB.4.8/include -O" LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib" --disable-tests --disable-bench --enable-upnp-default --with-gui --enable-glibc-back-compat --enable-reduce-exports

var7=`date`
echo "Start fase 5 : $var7 - Start make -j2" >> fase5.log

make -j2

var8=`date`
echo "Start fase 5 : $var8 - sudo make install" >> fase5.log

sudo make install

var9=`date`
echo "Start fase 5 : $var9 - Done..." >> fase5.log
echo ''
cat fase5.log
