#!/bin/bash

SCRIPTNAME=$(echo $0 | rev | cut -d/ -f 1 | rev)

set -f

if [ "$1" != "" ] &&  [ "$1" != "empty" ]; then
    echo "$SCRIPTNAME (empty)"
    exit 2
fi

#MYID=$(id -u)
if [ $UID != 0 ]; then
     echo "You need to be root"
     exit 2
fi

for l in $(cat /etc/shadow)
do 
 USERNAME=$(echo $l | cut -d: -f 1)
 PASSWORD=$(echo $l | cut -d: -f 2)
 if [ "$1" == "empty" ]; then
     if [ "$PASSWORD" == "!" ] || [ "$PASSWORD" == "*" ]; then
          echo $USERNAME
     fi
 else
     if [ "$PASSWORD" != "!" ] && [ "$PASSWORD" != "*" ]; then
          echo $USERNAME
     fi
 fi
done