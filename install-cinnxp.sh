#!/bin/bash
# Add wallpaper
cd /usr/share/wallpapers
wget https://github.com/jacksonhorton/bash-scripts/raw/main/xp-desk.jpg
gsettings set org.cinnamon.desktop.background picture-uri file:/usr/share/wallpapers/xp-desk.jpg

# Start with rest of install
cd ~/
sudo apt-get install build-essential
sudo apt-get install git
sudo apt-get install libglib2.0-dev

sudo git clone https://github.com/sass/sassc.git
sudo git clone https://github.com/sass/libsass.git

cd sassc
SASS_LIBSASS_PATH=../libsass make
sudo SASS_LIBSASS_PATH=../libsass make install
cd ..
git clone https://github.com/ndwarshuis/CinnXP
cd CinnXP
./compile-theme

sudo mkdir /usr/share/icons/
sudo mkdir /usr/share/themes/

sudo cp -r pkg/usr/share/icons/CinnXP/ /usr/share/icons/
sudo cp -r pkg/usr/share/themes/CinnXP-Luna/ /usr/share/themes/

cd ~/
git clone https://github.com/B00merang-Artwork/Windows-XP
mv Windows-XP/ winxp-themes/
git clone https://github.com/B00merang-Project/Windows-XP
sudo cp -r Windows-XP/Windows\ XP\ Luna/metacity-1/ /usr/share/themes/CinnXP-Luna/
sudo cp -r winxp-themes/ /usr/share/icons/
