#!/bin/bash
# evenodd.sh <number>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

n=$1

if [ $((n % 2)) -eq 0 ]; then
    echo "$n is even"
else
    echo "$n is odd"
fi
