#!/bin/bash

if [[ $# != 2 ]]
then
  echo "Not the right amount of arguments"
  exit 1
elif [[ ! -f $1 ]] || [[ ! -f $2 ]]
then
  echo "The arguments must be filenames"
  exit 2
fi

tmpfile="tmpfile_$1_to_$2"
mv $1 ${tmpfile}
mv $2 $1
mv ${tmpfile} $2

