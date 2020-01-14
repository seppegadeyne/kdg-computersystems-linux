#!/bin/bash

[[ "${EUID}" -ne 0 ]] && { echo "Je hebt niet voldoende rechten om dit script uit te voeren!"; exit 1; }

IFS=$'\n'
output_file="/tmp/homedir_sizes.txt"
rm -f "${output_file}"

for directory in `grep -E ".+:[[:digit:]]{4,}:[[:digit:]]{4,}.*" /etc/passwd | cut -d : -f 6`
do
    if [[ -d "${directory}" && ! -z $"{directory}" ]]
    then
        du -hs  $directory >> /tmp/homedir_sizes.txt
    fi
done
