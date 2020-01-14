#!/bin/bash 

leesbare_entries=0
uitvoerbare_entries=0
leesbare_uitvoerbare_entries=0

[ ! -d "$1" ] && { echo "Dit is geen geldige directory"; exit 1; }

for item in $(ls -1 $1)
do
    #echo "Test op ${item}"
    [ -r "${item}" ] && leesbare_entries=$((leesbare_entries + 1))
    [ -x "${item}" ] && uitvoerbare_entries=$((uitvoerbare_entries + 1))
    if [ -r "${item}" ] && [ -x "${item}" ]                                                                                                                                                                        
    then
        leesbare_uitvoerbare_entries=$((leesbare_uitvoerbare_entries + 1))
    fi
done

echo "Het aantal leesbare entries: ${leesbare_entries}"
echo "Het aantal uitvoerbare entries: ${uitvoerbare_entries}"
echo "Het aantal leesbare en uitvoerbare entries: ${leesbare_uitvoerbare_entries}"
