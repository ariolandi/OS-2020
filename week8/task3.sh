#!/bin/bash

func () {
	cnt=0
	IFS=$'\n'
	for x in $(ls "$1")
	do
		name="$1/$x"
		typen=$(stat -c "%F" "$name")
		if [[ $typen == "symbolic link" ]]
			then
			if [[ ! -e "$name" ]]
			then
				cnt=$(($nt+1))
			else 
				stat -c "%N" "$name"
			fi
		fi
	done
	
	echo "Broken symlinks: $cnt"
	unset IFS
}


if [[ $(whoami) != "root" ]]
then
	echo "Only root!"
	exit 0
fi

if [[ $# == 0 ]] || [[ $# > 2 ]]
then
	echo "Invalid number of arguments"
	exit 1
elif [[ ! -d "$1" ]]
then 
	echo "The first argument must be a directory"
	exit 2
elif [[ $# == 1 ]]
then
	func $1
elif [[ ! -f "$2" ]]
then
	echo "The first argument must be a file"
	exit 2
else  
	func "$1" >> "$2"
fi
