#!/bin/bash
# greet.sh <name> <age>

if [ $# -lt 2 ]; then
    echo "Usage: $0 <name> <age>"
    exit 1
fi

name=$1
age=$2

echo "Hello, $name!"

if [ "$age" -ge 18 ]; then
    echo "You are an adult."
else
    echo "You are a minor."
fi
