#!/bin/bash
# calc.sh <num1> <op> <num2>

if [ $# -ne 3 ]; then
    echo "Usage: $0 <num1> <op> <num2>"
    exit 1
fi

a=$1
op=$2
b=$3

case $op in
    +) echo $((a + b)) ;;
    -) echo $((a - b)) ;;
    x) echo $((a * b)) ;;
    /)
        if [ "$b" -eq 0 ]; then
            echo "Division by zero"
            exit 3
        fi
        echo $((a / b))
        ;;
    *)
        echo "Unknown operator: $op"
        exit 2
        ;;
esac
