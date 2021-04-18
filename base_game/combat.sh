combat() {

PlayersName=0
PlayersHp=60
PlayersStr=15
EnemiesName=0
Enemieshp=30
EnemiesStr=10
FightLvl=0
choix=O
Attack=$1
Heal=$2

#affichage 
echo $"===================" fight$FightLvl echo $"=========================="

echo $EnemiesName
echo $EnemiesHP
echo $PlayersName
echo $PlayersHP

echo="Choisissez votre action"

select choix 1.Attack choix 2.Heal; do

	case $reply
	read 

while [ $PlayersHp -gt 0 || $EnemiesHP -gt 0 ]
do

echo "C'est l'heure du combat"

select attack ou heal
do
	echo "vous attaquez! $attack"
	echo "vous vous soignez! $heal"
 
}
