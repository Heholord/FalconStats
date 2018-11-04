#!/bin/bash

source "$(dirname "$0")/config.sh"

clear=$(tput sgr0)
dim=$(tput dim)

df_info="$(df -hl)"
echo "${df_info}" | head -n 1

for point in ${mountpoints}; do
    line=$(echo "${df_info}" | grep $point)
    usagePercent=$(echo "$line"|tail -n1|awk '{print $5;}'|sed 's/%//')
    usedBarWidth=$((($usagePercent*$barWidth)/100))

    bar=$(tput setaf 2)
    [ "${usagePercent}" -ge "${maxDiscUsage}" ] && bar=$(tput setaf 1)

    for sep in $(seq 1 $usedBarWidth); do
        bar="$bar="
    done
    bar="$bar$clear$dim"
    for sep in $(seq 1 $(($barWidth-$usedBarWidth))); do
        bar="$bar="
    done

    echo "${line}"|tail -n1
    echo -e "[$bar$clear]"
done
