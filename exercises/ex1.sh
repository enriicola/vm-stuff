#!/bin/bash

# check if args are valid
if [ $# -ne 3 ]; then # -ne = not equal
    echo "Usage: $0 filename color integer"
    exit 1
fi

if [ ! -f $1 ]; then # check if file exists
    echo "File $1 does not exist!"
    exit 2
fi

# check if color is valid
if [ $2 != "red" ] && [ $2 != "blue" ] && [ $2 != "yellow" ] && [ $2 != 
"white" ] && [ $2 != "green" ]; then
    echo "Color $2 is not valid!"
    exit 3
fi

# check if integer is valid
# if ! [[ $3 =~ ^[0-9]+$ ]]; then
#     echo "Integer $3 is not valid!"
#     exit 4
# fi

# check if color appears i times in file
if [ $(grep -c $2 $1) -eq $3 ]; then # grep -c color filename = count how 
many times color appears in file
    echo "True"
else
    echo "False"
fi
