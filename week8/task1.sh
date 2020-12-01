#!/bin/bash

if [[ $# != 1 ]]
then
	echo "Invalid number of arguments"
	exit 1
elif [[ ! -d "$1" ]]
then
	echo "The argument has to be a directory"
	exit 2
fi

IFS=$'\n'
for x in $(ls "$1"/*.c)
do
	name=(echo $x | head -c -3)
	cc -o "${name}.exe" "$x" &
done
unset IFS
