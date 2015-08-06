#!/bin/sh
if [ "$1" = "simple" ]; then
	echo Create simple Makefile 
	cp ~/.JangoSettings/linux/setting/MakefileSimple ./Makefile
else
	echo Create Makefile 
	cp ~/.JangoSettings/linux/setting/Makefile ./Makefile
fi
