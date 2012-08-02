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

select=$(cat ./list.txt | tr "~" "\t"  | zenity --list --title "Search Results" --text "Finding all header files.." --column "Files")
 
wget $select &
sleep 5
$player ./*.ogg
