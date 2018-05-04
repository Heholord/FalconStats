#!/bin/bash

// @author   https://www.reddit.com/user/LookAtMyKeyboard

# Declare array of services and pretty human readable names
declare -a services=(
"smbd"
"plexmediaserver"
"sshguard"
"rsync"
"ufw"
"apcupsd"
"postgresql"
"redis-server"
)
declare -a serviceName=(
"Samba"
"Plex"
"SSH Guard"
"RSync"
"UFW"
"APC UPS Daemon"
"PostgreSQL"
"Redis"
)
declare -a serviceStatus=()

# Get status of all my services
for service in "${services[@]}"
do
    serviceStatus+=($(systemctl is-active "$service.service"))
done

# Maximum column width
#width=$((49-2))
width=$((64-2))

# Current line and line length
line="  "
lineLen=0

echo ""
echo "Services running:"

for i in ${!serviceStatus[@]}
do
    # Next line and next line length
    next=" ${serviceName[$i]}: \e[5m${serviceStatus[$i]}"
    nextLen=$((1+${#next}))

    # If the current line will exceed the max column with then echo the current line and start a new line
    if [[ $((lineLen+nextLen)) -gt width ]]; then
    echo -e "$line"
    lineLen=0
    line="  "
    fi

    lineLen=$((lineLen+nextLen))

    # Color the next line green if it's active, else red
    if [[ "${serviceStatus[$i]}" == "active" ]]; then
    line+="\e[32m\e[0m${serviceName[$i]}: \e[32m● ${serviceStatus[$i]}\e[0m "
    else
    line+="${serviceName[$i]}: \e[31m▲ ${serviceStatus[$i]}\e[0m "
    fi
done

# echo what is left
echo -e "$line"
