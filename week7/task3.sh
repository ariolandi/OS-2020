#!/bin/bash

number_of_children () {
	pid=$1
#	echo "${pid}"
#	ps ${pid}
	cnt=0
	for x in $(ps -e -o ppid)
	do
		if [[ $x == ${pid} ]]
		then
			cnt=$(($cnt+1))
		fi
	done
	echo  $cnt 
}

IFS=$'\n'
for x in $(ps -e -o pid,ppid,command)
do
	pid=$(echo $x | head -c 5)
	ppid=$(echo $x | head -c 11 | tail -c 5)
	cmd=$(echo $x | tail -c +12 | cut -d' ' -f2)

	cnt1=$(number_of_children ${pid})
	cnt2=$(number_of_children ${ppid})

	if [[ $(expr $cnt1) > $(expr $cnt2) ]]	
	then
		echo "pid: ${cnt1} ; ppid: ${cnt2}"

	fi
done
unset IFS


