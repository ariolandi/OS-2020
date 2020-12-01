#!/bin/bash

if [[ $# != 1 ]]
then
	echo "we need a file"
	exit 1
elif [[ ! -f $1 ]]
then
	echo "not a file"
	exit 2
fi

filename="table.html"
touch ${filename}
echo "<table>" >> ${filename}
touch tmp
echo "FN Firstname Lastname Speciality Course" >> tmp
cat $1 >> tmp
IFS=$'\n'
tag="th"
for x in $(cat tmp)
do
	IFS=' '
	echo " <tr>" >> ${filename}
	for y in $(echo $x)
	do
		echo "  <${tag}>$y</${tag}>" >> ${filename}
	done
	echo " </tr>" >> ${filename}
	IFS=$'\n'
	tag="td"
done
echo "</table>" >> ${filename}
rm tmp
unset IFS
