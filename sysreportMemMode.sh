    mem)
        TOTAL=$(free -m | awk '/^Mem:/ {print $2}')
        USED_MEM=$(free -m | awk '/^Mem:/ {print $3}')
        AVAIL=$(free -m | awk '/^Mem:/ {print $7}')
        PCT=$(( USED_MEM * 100 / TOTAL ))

        echo "Total:     ${TOTAL} MB"
        echo "Used:      ${USED_MEM} MB (${PCT}%)"
        echo "Available: ${AVAIL} MB"

        if [ "$PCT" -ge 90 ]; then
            echo "Status: CRITICAL"
        elif [ "$PCT" -ge 70 ]; then
            echo "Status: WARNING"
        else
            echo "Status: OK"
        fi
        ;;
