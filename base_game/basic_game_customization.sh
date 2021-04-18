#!/bin/bash

etage=1
PlayersHp=20
Combat=Win
	echo "vous etes à l'étage 1"

	echo "c'est l'heure du combat"

while [ $PlayersHp -gt 0 && $etage -le 10]
do
	if [ $Combat -eq $Win ]; then
	((etage=etage +1))

	echo "Bravo vous montez d'un étage"

	else "Vous etes mort"
	fi
	
	while [ $etage -eq 10 ];
	do echo "Le boss de fin arrive"

done
