#!/bin/bash

# create a script that accepts a filename f, 
# a color c (red, blue, yellow, white or green) and an integer i as args and 
# return true iff c appears i times in f

FILENAME=$1
COLOR=$2
I=$3

VALIDCOLOR="red blue yellow white green "

SCRIPTNAME=$(echo $0 | rev | cut -d/ -f 1 | rev)

if [ $# -lt 3 ]; then
	echo "This command count the entries of a list of directories."
	echo
	echo "$SCRIPTNAME [filename] [color: red, blue, yellow, white or green] [i]"
	exit
fi

if [ ! -f $FILENAME ]; then
     echo "$FILENAME is not a file"
     exit 2

fi

echo $VALIDCOLOR | grep "$COLOR " > /dev/null
if [ $? != 0 ]; then
 echo "$COLOR is not a valid color"
 exit 2
fi

if ! [ $I -gt -1 ] 2> /dev/null 
then
 echo "$I is not a number"
 exit 2
fi

TIMES=$(grep $COLOR $FILENAME | wc -l)
if [ $TIMES == $I ]; then
 echo "true"
 exit 0
else
 echo "false"
 exit 1
fi