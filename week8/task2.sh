#!/bin/bash

subtask1 () {
	IFS=$'\n'
	for x in $(ls "$1")
	do
		name="$1/$x"
		hardlinks=$(stat -c "%h" "$name")
		if [[ $hardlinks -ge $2 ]]
		then
			echo $name
		fi
	done

	unset IFS
}

subtask2 () {
	IFS=$'\n'
	for x in $(ls "$1")
	do
		name="$1/$x"
		typen=$(stat -c "%F" "$name")
		if [[ $typen == "symbolic link" ]] && [[ ! -e "$name" ]]
		then
			echo $name
		fi
	done

	unset IFS
	
}

if [[ $# == 0 ]] || [[ $# > 2 ]]
then
	echo "Invalid number of arguments"
	exit 1
elif [[ $# == 2 ]]
then
	subtask1 "$1" "$2"
else
	subtask2 "$1"
fi

