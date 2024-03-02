#!/bin/bash
## Script Developed by atorres:  github.com/atorresbr (( atorresnh@gmail.com ))
## Commands to clear the memories by Philipp Klaus github.com/pklaus 
## (( https://github.com/pklaus?tab=repositories&q=&type=&language=shell&sort= ))


##this functio send the error mesage to user if his not use the sudo command
if [ "$(whoami)" != "root" ]
then
  echo
    echo -e " 🔴 use sudo to run this script "
  echo
  exit 1
fi

red_intense='\033[1;91m'  # Red
on_blue='\033[0;94m'      # Blue
on_yellow='\033[0;93m'    # Yellow
on_green='\033[42m'       # Green
b_black='\033[1;30m'      # black
b_green='\033[1;32m'      # Bold Green
green='\033[0;32m'        # Light Green
red='\033[0;31m'          # Red
nc='\033[0m'              # No Color

sleep 2
echo -ne " ${b_green}

   * ================================================== * 
  *            Wellcome to Ram Swap Cleaner              *
   * ================================================== * 
    
         " ${nc}
echo
echo

sleep 2

echo -ne " ${b_green} This script will clear the memory swap and cached memory to free up your RAM. 🙌" ${nc}

echo
echo

free_h=$(free -h)
echo -ne ${on_yellow} 
echo "$free_h "
echo -ne ${nc}


## Get Memory Information
freemem_before=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && freemem_before=$(echo "$freemem_before/1024.0" | bc)
cachedmem_before=$(cat /proc/meminfo | grep "^Cached" | tr -s ' ' | cut -d ' ' -f2) && cachedmem_before=$(echo "$cachedmem_before/1024.0" | bc)

echo
echo


## Test sync
if [ "$?" != "0" ]
then
  echo -ne " ${red_intense} Something went wrong, It's impossible to sync the filesystem. " ${nc}
  exit 1
fi

# Clear Filesystem Buffer using "sync" and Clear Caches
sync && echo 3 > /proc/sys/vm/drop_caches

freemem_after=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && freemem_after=$(echo "$freemem_after/1024.0" | bc)

echo -ne " ${red_intense}🧮 Cleaning you Swap Memory " 
echo
sleep 1

swapoff -a && swapon  -a && \
echo
sleep 1

echo -ne " ${on_yellow}🧮 Cleaning you cached Memory " ${nc}
echo
echo
sleep 2

echo -ne " ${b_green} At the moment you have $cachedmem_before MiB cached and $freemem_before MiB free memory." ${nc}

## Get Memory Information
freemem_before=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && freemem_before=$(echo "$freemem_before/1024.0" | bc)
cachedmem_before=$(cat /proc/meminfo | grep "^Cached" | tr -s ' ' | cut -d ' ' -f2) && cachedmem_before=$(echo "$cachedmem_before/1024.0" | bc)

echo
echo


## Test sync
if [ "$?" != "0" ]
then
  echo " Something went wrong, It's impossible to sync the filesystem. "
  exit 1
fi

# Clear Filesystem Buffer using "sync" and Clear Caches
sync && echo 3 > /proc/sys/vm/drop_caches

freemem_after=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && freemem_after=$(echo "$freemem_after/1024.0" | bc)

# Output Summary
echo -ne ${on_green}
echo -ne " So, you RAM after $(echo "$freemem_after - $freemem_before" | bc) MiB, and now you have $freemem_after MiB of free RAM. 😀 " ${nc}

echo
echo

echo -ne " 😘 Share this Script ! 🙌 "

exit 0



###################################
#       choose you collor         #
###################################


# Reset / no collor 
#Color_Off='\033[0m'       # Text Reset

# Regular Colors

#Black='\033[0;30m'        # Black
#Red='\033[0;31m'          # Red
#Green='\033[0;32m'        # Green
#Yellow='\033[0;33m'       # Yellow
#Blue='\033[0;34m'         # Blue
#Purple='\033[0;35m'       # Purple
#Cyan='\033[0;36m'         # Cyan
#White='\033[0;37m'        # White

# Bold

#BBlack='\033[1;30m'       # Black
#BRed='\033[1;31m'         # Red
#BGreen='\033[1;32m'       # Green
#BYellow='\033[1;33m'      # Yellow
#BBlue='\033[1;34m'        # Blue
#BPurple='\033[1;35m'      # Purple
#BCyan='\033[1;36m'        # Cyan
#BWhite='\033[1;37m'       # White

# Underline

#UBlack='\033[4;30m'       # Black
#URed='\033[4;31m'         # Red
#UGreen='\033[4;32m'       # Green
#UYellow='\033[4;33m'      # Yellow
#UBlue='\033[4;34m'        # Blue
#UPurple='\033[4;35m'      # Purple
#UCyan='\033[4;36m'        # Cyan
#UWhite='\033[4;37m'       # White

# Background

#On_Black='\033[40m'       # Black
#On_Red='\033[41m'         # Red
#On_Green='\033[42m'       # Green
#On_Yellow='\033[43m'      # Yellow
#On_Blue='\033[44m'        # Blue
#On_Purple='\033[45m'      # Purple
#On_Cyan='\033[46m'        # Cyan
#On_White='\033[47m'       # White

# High Intensity

#IBlack='\033[0;90m'       # Black
#IRed='\033[0;91m'         # Red
#IGreen='\033[0;92m'       # Green
#IYellow='\033[0;93m'      # Yellow
#IBlue='\033[0;94m'        # Blue
#IPurple='\033[0;95m'      # Purple
#ICyan='\033[0;96m'        # Cyan
#IWhite='\033[0;97m'       # White

# Bold High Intensity

#BIBlack='\033[1;90m'      # Black
#BIRed='\033[1;91m'        # Red
#BIGreen='\033[1;92m'      # Green
#BIYellow='\033[1;93m'     # Yellow
#BIBlue='\033[1;94m'       # Blue
#BIPurple='\033[1;95m'     # Purple
#BICyan='\033[1;96m'       # Cyan
#BIWhite='\033[1;97m'      # White

# High Intensity backgrounds

#On_IBlack='\033[0;100m'   # Black
#On_IRed='\033[0;101m'     # Red
#On_IGreen='\033[0;102m'   # Green
#On_IYellow='\033[0;103m'  # Yellow
#On_IBlue='\033[0;104m'    # Blue
#On_IPurple='\033[0;105m'  # Purple
#On_ICyan='\033[0;106m'    # Cyan
#On_IWhite='\033[0;107m'   # White