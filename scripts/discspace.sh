#!/bin/bash

myDir=$(dirname "$0")
source "$myDir/config.sh"

clear=$(tput sgr0)
dim=$(tput dim)

for point in ${mountpoints}; do
    line=$(df -hl "${point}")
    usagePercent=$(echo "$line"|tail -n1|awk '{print $5;}'|sed 's/%//')
    usedBarWidth=$((($usagePercent*$barWidth)/100))
    barContent=""
    if [ "${usagePercent}" -ge "${maxDiscUsage}" ]; then
        color=$(tput setaf 1)
    else
        color=$(tput setaf 2)
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
