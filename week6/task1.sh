#!/bin/bash

if [[ $# != 2 ]]
then
  echo "Not the right amount of arguments"
  exit 1
elif [[ ! -d "$1" ]] || [[ ! -d "$2" ]] 
then 
  echo "The arguments are not directories"
  exit 2
fi

out1=$(ls "$1"/*.out | wc -l)
out2=$(ls "$2"/*.out | wx -l)

if [[ out1 -gt out2 ]]
then
  dir="dir task1"
  mkdir "${dir}"
  echo "${dir}"
  
  for x in "$1"
  do
    stats=$(stat --printf="%F:%A" "$1/$x")
    type=$(echo "${stats}" | cut -d':' -f 1)
    mod=$(echp "${stats}" | cut -d':' -d 2)
    if [[ "${type}" == "regular file" ]] && [[ $(head -c 3 "${mod}") == "-rw" ]]
    then
      mv "$1/$x" "${dir}"/"$x"
    fi
  done
fi

  
