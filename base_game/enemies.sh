#!/bin/bash

compteur=0

while IFS=',' read -r id name hp mp str int def res spd luck race class rarity; do
	if [ $compteur -eq 12 ]; then
		echo $id $name $hp $str
	fi
	
	((compteur=compteur+1))

done < enemies.csv
