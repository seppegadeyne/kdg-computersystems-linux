#!/bin/bash 

[[ $# -ne 1 ]] && { echo "Geef exact één parameter!"; exit 1; }
[[ ! -d "${1}" ]] && { echo "Dit is geen geldige directory"; exit 1; }

leesbare_entries=0
uitvoerbare_entries=0
leesbare_uitvoerbare_entries=0

IFS=$'\n'

for item in $(ls -1 "${1}")
do
    echo "Test op ${item}"                                                                                                                                                                                         
    [[ -r "${1}/${item}" ]] && leesbare_entries=$((leesbare_entries + 1))
    [[ -x "${1}/${item}" ]] && uitvoerbare_entries=$((uitvoerbare_entries + 1))
    if [[ -r "${1}/${item}" ]] && [[ -x "${1}/${item}" ]]
    then
        leesbare_uitvoerbare_entries=$((leesbare_uitvoerbare_entries + 1))
    fi
done

echo "Het aantal leesbare entries: ${leesbare_entries}"
echo "Het aantal uitvoerbare entries: ${uitvoerbare_entries}"
echo "Het aantal leesbare en uitvoerbare entries: ${leesbare_uitvoerbare_entries}"
