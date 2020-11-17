#!/bin/bash

if [[ $# != 1 ]]
then
  echo "Not the right amount of arguments"
  exit 1
fi

grep "$1" /etc/passwd | cut -d':' -f 5,6
