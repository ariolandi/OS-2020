#!/bin/bash

read str
if [[ -z $@ ]]
then
  echo "No arguments"
  exit 1
fi

for x in $@
do
  if [[ -e "$x" ]]
  then
    grep "$str" "$x" | wc -l
  else
    echo "$X doesn't exist"
  fi
done

