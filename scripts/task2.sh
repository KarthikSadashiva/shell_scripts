

#!/bin/ksh
THRESHOLD="1"
LOAD=$(uptime | sed -e "s/^.*[a-z]: //; s/,.*//")
echo "One minute load average = $LOAD"
ld=${LOAD%.*}

if (($ld  >  $THRESHOLD  )); then
        echo "Load average too high "
else
        echo "Load average not too high "
fi

echo "Disk having usage beyond 25 %"
df -P | awk '0+$5 >= 25  {print}'

exit 0
