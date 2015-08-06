#!/bin/sh
RUN=1

PID=$(pidof $1)
LAST_FD_COUNT=$(ls -1 /proc/$PID/fd/ | wc -l)
FD_DIFF=0
TOTAL_DIFF=0
while [ $RUN -eq 1 ]; do
  #get current open fd
  FD_COUNT=$(ls -1 /proc/$PID/fd/ | wc -l)

  #fd difference compare to last check
  FD_DIFF=$((FD_COUNT - LAST_FD_COUNT))

  #total fd difference
  TOTAL_DIFF=$((TOTAL_DIFF + FD_DIFF))

  echo $(date +"%r"): $1 FD change: $TOTAL_DIFF fds 

  #update last opened fd count to current opened fd count
  LAST_FD_COUNT=$FD_COUNT
  
  sleep $2
done
