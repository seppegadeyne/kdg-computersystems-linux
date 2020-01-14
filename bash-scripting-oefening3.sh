#!/bin/bash

gekozen_nummer=0
opties=([0]=steen [1]=schaar [2]=papier)

while (( gekozen_nummer >= 0 ))
do
    nummer=$((RANDOM % 3))
    read -p "Keuze? steen/schaar/papier/stop: " keuze

    case $keuze in
        steen)
            gekozen_nummer=0
            ;;
        schaar)
            gekozen_nummer=1
            ;;
        papier)
            gekozen_nummer=2
            ;;
        stop)
            gekozen_nummer=-1
            exit 0                                                                                                                                                                                                 
            ;;
        *)  
            echo "Foutieve invoer"
            exit 1
    esac
    
    echo "Mijn keuze is ${opties[nummer]}" 
    [[ "${nummer}" -eq "${gekozen_nummer}" ]] && echo "Gelijkspel"
    [[ "${nummer}" -lt "${gekozen_nummer}" ]] && echo "Ik win :-)"
    [[ "${nummer}" -gt "${gekozen_nummer}" ]] && echo "Jij wint :("
done
