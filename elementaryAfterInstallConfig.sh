#!/bin/bash
#Simple bash config for installing basic software and drivers
echo ""
echo ""
echo "ELEMENTARY OS LOKI CONFIG SCRIPT @ ikurek"
echo ""
echo ""

apt-get install software-properties-common

#add chrome ppa
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

#add spotify ppa
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2C19886
sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'

#add atom ppa
add-apt-repository ppa:webupd8team/atom

#add android-studio ppa
add-apt-repository ppa:paolorotolo/android-studio

#add dropbox from github
echo "DROPBOX FOR ELEMENTARY NEEDS TO BE INSTALLED MANUALY"
echo "PLEASE RUN INSTALL.SH FROM /TMP/ELEMENTARY-DROPBOX AFTER THIS SCRIPT FINISHES"
git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox

#add elementary-tweaks ppa
add-apt-repository ppa:philip.scott/elementary-tweaks


#update apt-get
apt-get update

#install all required packages
apt-get install openjdk-8-jdk
apt-get install git
apt-get install google-chrome-stable
apt-get install spotify-client
apt-get install atom
apt-get install android-studio
apt-get install libreoffice
apt-get install elementary-tweaks
apt-get install vlc

#update system
apt-get upgrade

#cleanup
apt-get autoremove
apt-get clean

echo ""
echo ""
echo "DONE"
echo ""
echo ""
