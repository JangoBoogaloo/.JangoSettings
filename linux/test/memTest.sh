#!/bin/sh
RUN=1

PID=$(pidof $1)

LAST_MEM=$(cat /proc/$PID/status | grep -i Vmsize | awk {'print $2'})
MEM_DIFF=0
TOTAL_DIFF=0

while [ $RUN -eq 1 ]; do

  #get current Memory usage
  MEM=$(cat /proc/$PID/status | grep -i Vmsize | awk {'print $2'})

  #get mem difference compare with last check
  MEM_DIFF=$((MEM - LAST_MEM))

  #add the memory difference
  TOTAL_DIFF=$((TOTAL_DIFF + MEM_DIFF))

  #show the total memory difference
	echo $(date +"%r"): $1 Mem change: $TOTAL_DIFF KB 

  #update last memory usage to current memory usage
  LAST_MEM=$MEM

  sleep $2
done
