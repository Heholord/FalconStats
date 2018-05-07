#!/bin/bash

currentTime=$(date +%s)
my_domains="domain.com example.com"

printf "SSL Certificates:\n"
for domain in $my_domains; do
    delimiter="\t"
    certTime=$(openssl s_client -connect ${domain}:443 < /dev/null 2>/dev/null | openssl x509 -noout -enddate 2>/dev/null | cut -d= -f2)
    certLineTime=$(date -d "${certTime}" +"%a %b %d %Y")

    certTimestamp=$(date -d "${certTime}" +%s)
    if [ "${certTimestamp}" > "${currentTime}" ]; then
        sign="\e[32m●\e[0m"
    else
        sign="\e[31m▲\e[0m"
    fi

    if [ "${#domain}" -ge 10 ]; then
        delimiter="\t\t"
    fi

    printf " ${sign} ${domain} ${delimiter} valid until ${certLineTime}\n"
done
