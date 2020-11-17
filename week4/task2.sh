#!/bin/bash

if [[ $# != 1 ]]
then
  echo "Not the right amount of arguments"
  exit 1
fi

who | grep "$1" | wc -l
