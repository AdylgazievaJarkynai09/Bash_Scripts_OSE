#!/bin/bash
# sysreport.sh - mini system report tool
# Usage: ./sysreport.sh [basic|disk|user] [directory]

echo "=== System Report ==="

HOST=$(hostname)
USER_NAME=$(whoami)
NOW=$(date +"%Y-%m-%d %H:%M")
echo "Host: $HOST | User: $USER_NAME"
echo "Date: $NOW"

MODE=${1:-basic}
DIR=${2:-/}
echo "Mode: $MODE (args: $#)"

if [ $# -gt 2 ]; then
    echo "Usage: $0 [basic|disk|user] [dir]"
    exit 1
fi

case $MODE in
    basic)
        echo "Kernel: $(uname -r)"
        echo "Arch:   $(uname -m)"
        echo "Uptime: $(uptime -p)"
        ;;
    disk)
        if [ ! -d "$DIR" ]; then
            echo "Error: $DIR is not a directory"
            exit 3
        fi
        USED=$(df "$DIR" | awk 'NR==2 {print $5}' | tr -d '%')
        echo "Disk usage of $DIR: $USED%"
        if [ "$USED" -ge 90 ]; then
            echo "Status: CRITICAL"
        elif [ "$USED" -ge 70 ]; then
            echo "Status: WARNING"
        else
            echo "Status: OK"
        fi
        ;;
    user)
        PROCS=$(ps -u "$USER_NAME" --no-headers | wc -l)
        echo "Home: $HOME | Shell: $SHELL"
        echo "Processes: $PROCS"
        if [ "$(id -u)" -eq 0 ]; then
            echo "WARNING: running as root"
        fi
        ;;
    *)
        echo "Unknown mode: $MODE"
        exit 2
        ;;
esac

echo "=== Report finished ==="
exit 0
