#!/bin/bash

myDir=$(dirname "$0")
source "$myDir/config.sh"

clear="\e[39\e[0m"
dim="\e[2m"

for point in ${mountpoints}; do
    line=$(df -hl "${point}")
    usagePercent=$(echo "$line"|tail -n1|awk '{print $5;}'|sed 's/%//')
    usedBarWidth=$((($usagePercent*$barWidth)/100))
    barContent=""
    color="\e[32m"
    if [ "${usagePercent}" -ge "${maxDiscUsage}" ]; then
        color="\e[31m"
    fi
    barContent="${color}"
    for sep in $(seq 1 $usedBarWidth); do
        barContent="${barContent}="
    done
    barContent="${barContent}${clear}${dim}"
    for sep in $(seq 1 $(($barWidth-$usedBarWidth))); do
        barContent="${barContent}="
    done
    bar="[${barContent}${clear}]"
    if [ "${titeled}" == "" ]; then
        echo "${line}"
        titeled="1"
    else
        echo "${line}"|tail -n1
    fi
    echo -e "${bar}"
done
