#!/bin/sh

player=vlc
basedir=$HOME
mkdir -p $basedir/Music/radio;
cp ./list.txt $basedir/Music;
cd $basedir/Music/;

for i in `ls *ogg`;
do
killall -9 wget;
count=$(ls radio/*ogg | grep -c ogg);
c=$(echo "$count+1" | gcalccmd | replace ">" "" | replace " " "");
echo $i $c
sh -c "mv "$i" radio/"$i"-"$c".ogg";

done;
count=$(find ${1-.} | wc -l) # Anzahl der Dateien

select=$(cat ./list.txt | tr "~" "\t"  | zenity --list --title "In your radio list are these..." --text "Finding all radio urls.." --column "Files")
 
 
if [ "$select" = "" ]
then
exit;
fi


wget $select  &
sleep 5
$player ./*.ogg


