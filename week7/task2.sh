#!/bin/bash

IFS=$'\n'
for x in $(ps -e)
do
	tty=$(echo $x | head -c 14 | tail -c 8 | cut -d' ' -f1) # to get only the tty, without added blankspaces
	command=$(echo $x | tail -c +25) #to get the bash command
	if [[ $tty == '?' ]]
	then
		echo $command
	fi
done

unset IFS

