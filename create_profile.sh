#!/bin/sh
if [ "$1" = "linux" ]; then
	echo Create $1 proile 
	cp ~/.JangoSettings/linux/bash_profile ~/.bash_profile
elif [ "$1" = "mac" ]; then
	echo Create $1 proile
	cp ~/.JangoSettings/mac/bash_profile ~/.bash_profile
else
	echo Wrong argument $1
	echo $0 "mac|linux"
fi
