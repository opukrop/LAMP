#!/bin/bash

####################################################
# Bash script for install Apache MySQL PHP on server
# Whitten by torlov
####################################################

#COLORS
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan

################ Checking if user root ##########################
if [ "$EUID" -ne 0 ]
  then
  	echo -e "$Red You must run this as root user.. $Color_Off"
  exit
fi

########################## Checking OS #############################

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID

else
    OS=$(uname -s)
    VER=$(uname -r)
fi

echo -e "$Yellow Your OS:$OS $VER $Color_Off"

###################### Update Repositories #################

if [ OS == CentOS Linux ]; then
    echo -e "$Cyan==========Update yum cache==========$Color_Off"
    yum makecache

else
    echo -e "$Cyan==========Update apt-get==========$Color_Off"
    apt-get update
fi

echo -e "$Green END $Color_Off"
