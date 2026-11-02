#!/bin/bash
# inspect.sh <path>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <path>"
    exit 1
fi

f=$1

if [ ! -e "$f" ]; then
    echo "Not found: $f"
    exit 2
fi

if [ -d "$f" ]; then
    echo "Directory"
else
    echo "File, $(wc -c < "$f") bytes"
fi

if [ -r "$f" ]; then
    echo "Readable"
else
    echo "Not readable"
fi
