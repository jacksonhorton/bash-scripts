#!/bin/bash
read -p "Do you wish to install this program?" yn
case $yn in
    [Yy]* ) sudo apt remove firefox; echo "Done";;
    [Nn]* ) echo "Done";;
    * ) echo "Done.";;
esac