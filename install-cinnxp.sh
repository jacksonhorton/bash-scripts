#!/bin/bash
cd ~/
apt-get install build-essential
apt-get install git
apt-get install libglib2.0-dev

git clone https://github.com/sass/sassc.git
git clone https://github.com/sass/libsass.git

cd sassc
SASS_LIBSASS_PATH=../libsass make
sudo SASS_LIBSASS_PATH=../libsass make install


git clone https://github.com/ndwarshuis/CinnXP

cd CinnXP

./compile-theme

sudo cp -r pkg/usr/share/icons/CinnXP/ /usr/share/icons/
sudo cp -r pkg/usr/share/themes/CinnXP-Luna/ /usr/share/themes/

cd ~/

git clone https://github.com/B00merang-Artwork/Windows-XP
mv Windows-XP/ winxp-themes
git clone https://github.com/B00merang-Project/Windows-XP
sudo cp -r Windows-XP/Windows\ XP\ Luna/metacity-1/ /usr/share/themes

sudo mv /usr/shares/themes/metacity-1/ /usr/shares/themes/CinnXP-Luna/metacity-1/
cd ~/
sudo mkdir /usr/share/icons/
sudo cp -r winxp-themes/ /usr/share/icons/CinnXP-Luna/



read -p “Finish process now…”
