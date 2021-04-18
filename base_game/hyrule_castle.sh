#!/bin/bash

# variable du joueur ,de l'ennnemis et du boss
HpPlayer=0
NamePlayer=""
StrPlayer=0
HealPlayer=0

HpEnemies=0
NameEnemies=""
StrEnemies=0

HpBoss=0
NameBoss=""
StrBoss=0

# numéro de la ligne
compteur=0

# boucle pour récuperer les valeur du fichier .csv
while IFS=',' read -r id name hp mp str int def res spd luck race class rarity; do
        if [ $compteur -eq 12 ]; then
        HpEnemies=$hp
	NameEnemies=$name
	StrEnemies=$str
        fi

        ((compteur=compteur+1))

done < enemies.csv

compteur=0

while IFS=',' read -r id name hp mp str int def res spd luck race class rarity; do
	if [ $compteur -eq 1 ]; then
	HpPlayer=$hp 
	NamePlayer=$name
	StrPlayer=$str
	((HealPlayer=$hp/2))
	fi

	((compteur=compteur+1))
done < players.csv

compteur=0

while IFS=',' read -r id name hp mp str int def res spd luck race class rarity; do
        if [ $compteur -eq 1 ]; then
        HpBoss=$hp
	NameBoss=$name
	StrBoss=$str
        fi
        ((compteur=compteur+1))

done < bosses.csv

# variable du jeu
boucleDuJeu=0

niveau=1
HpEnemiesNiveau=0
NameEnemiesNiveau=0
StrEnemiesNiveau=0

#boucle du jeu

while [ $boucleDuJeu -ne 1 ] ;
do
	echo "Vous etes au niveau $niveau"
#condition
	if [[ $HpEnemiesNiveau -le 0 ]] ; then
	HpEnemiesNiveau=$HpEnemies
	NameEnemiesNiveau=$NameEnemies
	StrEnemiesNiveau=$StrEnemies
	((niveau=niveau+1))
	if [ $niveau -eq 11 ] ; then
	echo "Ganon arrive"
	HpEnemiesNiveau=$HpBoss
	NameEnemiesNiveau=$NameBoss
	StrEnemiesNiveau=$StrBoss
	fi
	fi
	echo "0 : Attaquer"
	echo "1 : Soigner" 
	read  action
	echo ""
	if [ $action -eq 0 ] ; then
	echo "vous attaquez $NameEnemiesNiveau"
	((HpEnemiesNiveau=$HpEnemiesNiveau-$StrPlayer))
	fi
	if [ $action -eq 1 ] ; then
	echo "vous vous soignez"
	((HpPlayer=$HpPlayer+$HealPlayer))
	if [ $HpPlayer -ge 60 ] ; then
	HpPlayer=60
	fi
	fi
	if  [ $action = 2 ] ; then
	((HpEnemiesNiveau=$HpEnemiesNiveau-10000))
	echo "ONEEEEEEEEEPUNCHHHHHHHHHHHHHHHHHH?"
	echo "L'ennemi de l'etage : $NameEnemiesNiveau est mort"
	fi
	echo "vous avez $HpPlayer HP"
	echo ""
	if [ $HpEnemiesNiveau -gt 0 ] ; then 
	echo "$NameEnemiesNiveau vous inflige $StrEnemiesNiveau hp"
	((HpPlayer=$HpPlayer-$StrEnemiesNiveau))
	echo "il vous reste $HpPlayer HP"
	fi
	if [ $HpPlayer -le 0 ] ; then
	echo "Vous etes mort"
	boucleDuJeu=1
	fi
	if [ $niveau -gt 10 ] ; then
	boucleDuJeu=1
	echo  "vous avez gagnez"
	fi

	echo "" 
done

