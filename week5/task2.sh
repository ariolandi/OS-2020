#!/bin/bash

if [[ $# != 2 ]]
then
  echo "Not the right amount of arguments"
  exit 1
fi

if [[ -d "$1" ]]
then
  for x in $(ls "$1")
  do
    sz=$(wc -c "$1/$x")
    if [[ sz > $2 ]]
    then
      echo "$x"
    fi
  done
else
  echo "$1 os not a directory!"
fi

