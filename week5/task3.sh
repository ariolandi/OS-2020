#!/bin/bash

if [[ $# -gt 3 ]]
then
 echo "Not the right amount of arguments"
 exit 1
fi

if [[ $1 == "-w" ]]
then
  if [[ $2 == "-l" ]]
  then
    if [[ ! -f "$3" ]]
    then
      echo "Not the right arguments"
      exit 2
    else
      wcnt=0
      for word in $(cat "$3")
      do
        wcnt=$((${wcnt}+1))
      done

      IFS=$'\n'
      lcnt=0
      for line in $(cat "$3")
      do
        lcnt=$((${lcnt}+1))
      done
      
      unset IFS
      echo "${wcnt} words | ${lcnt} lines"
   fi
  elif [[ ! -f "$2" ]]
  then
    echo "Not the right arguments"
    exit 3
  else
    wcnt=0
    for x in $(cat "$2")
    do
      wcnt=$((${wcnt}+1))
    done

    echo "${wcnt} words"
  fi
elif [[ $1 == '-l' ]]
then 
  if [[ ! -f "$2" ]]
  then
    echo "Not the right arguments"
    exit 4
  else
    lcnt=0
    IFS=$'\n'
    for x in $(cat "$2")
    do
      lcnt=$((${lcnt}+1))
    done
    
    unset IFS
    echo "${lcnt} lines"
  fi
fi

