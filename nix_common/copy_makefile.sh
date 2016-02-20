#!/bin/sh
if [ "$1" = "simple" ]; then
	echo Create simple Makefile 
	cp ~/.JangoSettings/nix_common/setting/MakefileSimple ./Makefile
else
	echo Template Makefile 
	cp ~/.JangoSettings/nix_common/setting/Makefile ./Makefile
fi

