#!/bin/bash
if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

if [ $1 == "empty" ]; then
    cat /etc/passwd | grep -E '^[^:]*:[*!]'
else
    cat /etc/passwd | grep -E '^[^:]*:[^*!]'
fi
