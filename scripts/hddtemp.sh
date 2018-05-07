#!/bin/bash

my_drives="sdb sdc sdd sde sdf"
my_target_temp=38
sudo="sudo"
clear="\e[49m"

printf "Hard disc temperature:\n"
for drive in $my_drives; do
    color="\e[42m"
    temperature=$(${sudo} hddtemp -qn /dev/${drive} 2> /dev/null)

    if [ "$temperature" -ge "${my_target_temp}" ]; then
        color="\e[41m"
    fi

    printf " ${color} ${drive} ${temperature}° ${clear}"
done
