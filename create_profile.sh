#!/bin/sh
if [ "$1" = "linux" ]; then
	echo Create $1 proile 
	cp ~/.JangoSettings/linux/setting/bash_profile ~/.bash_profile
elif [ "$1" = "mac" ]; then
	echo Create $1 proile
	cp ~/.JangoSettings/mac/setting/bash_profile ~/.bash_profile
else
	echo Wrong argument $1
fi
