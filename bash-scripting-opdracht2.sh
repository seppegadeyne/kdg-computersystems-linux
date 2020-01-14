#!/bin/bash 

[[ $# -ne 1 ]] && { echo "Geef exact één parameter!"; exit 1; }
[[ ! -d "${1}" ]] && { echo "Dit is geen geldige directory"; exit 1; }

# Copy whole directory and sub directories to /tmp
cp -R "${1}" /tmp   
