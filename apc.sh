#!/bin/bash

# @author   https://www.reddit.com/user/LookAtMyKeyboard

OUTPUT=$(apcaccess)

status=$(echo "$OUTPUT" | grep "STATUS")
statusRe="STATUS   : (\S*)"

charge=$(echo "$OUTPUT" | grep "BCHARGE")
chargeRe='([0-9]+)\.[0-9]? Percent'

timeleft=$(echo "$OUTPUT" | grep "TIMELEFT")
timeleftRe='([0-9]+)\.[0-9]? Minutes'

outage=$(echo "$OUTPUT" | grep "LASTXFER")
outageRe="LASTXFER : (.*)"

[[ $status =~ $statusRe ]]
status=${BASH_REMATCH[1]}

[[ $charge =~ $chargeRe ]]
charge=${BASH_REMATCH[1]}

[[ $timeleft =~ $timeleftRe ]]
timeleft=${BASH_REMATCH[1]}

[[ $outage =~ $outageRe ]]
outage=${BASH_REMATCH[1]}

# Making the battery charge progress bar
chargeBar=""

# 1. Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)
function ProgressBar {
# Process data
    let _progress=(${1}*10/${2}*10)/10
    let _done=(${_progress}*10)/10
    let _left=10-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:
# 1.2.1.1 Progress : [########################################] 100%
printf "[\e[32m${_fill// /=}\e[0m${_empty// / }]"

}

chargeBar=$(ProgressBar $charge 100)

if [[ $status == "ONLINE" ]]; then
    status="\e[32mONLINE\e[0m"
else
    status="\e[31m$status\e[0m"
fi

echo -e "\nUPS: $status $chargeBar $charge% $timeleft Minutes left\n  Last out: $outage"
