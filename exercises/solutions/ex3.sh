#!/bin/bash

# create a script that accepts a program name n 
# and a message m as args. It loops checking if n is running.
# If n is not running, logs for 3 times the message m

SCRIPTNAME=$(echo $0 | rev | cut -d/ -f 1 | rev)

if [ $# -lt 2 ]; then
	echo "This command count the entries of a list of directories."
	echo
	echo "$SCRIPTNAME [process_name] [message]"
	exit
fi

PROCESSNAME=$1
MESSAGE=$2

COUNTER=$(ps x | grep $PROCESSNAME | grep -v grep | grep -v $SCRIPTNAME | wc -l)

if [ $COUNTER -gt 0 ]; then
    echo "$PROCESSNAME is running $COUNTER times"
else
    echo "$PROCESSNAME is not running"
    for n in {1..3}
    do
     logger "$n: $MESSAGE"
    done 
fi