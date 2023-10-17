#!/bin/bash
# check if the number of arguments is correct
if [ $# -ne 2 ]; then
    echo "Usage: $0 <program_name> <message>"
    exit 1
fi

# check if the program is running with pgrep
pgrep $1 > /dev/null
if [ $? -ne 0 ]; then
    echo "The program $1 is not running"
    exit 2
fi

# if the program is running, log the message 3 times
for i in $(seq 3); do
    echo $2
done
