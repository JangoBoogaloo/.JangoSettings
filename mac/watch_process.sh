#!/bin/sh
PID=$(ps aux | grep -v "grep" | grep -v "watch.sh"| grep $1 | awk {'print $2'})
if [ "$PID" == "" ]; then
	echo Process Not Found: $1
else
	echo $PID
	top -pid  $PID
fi
