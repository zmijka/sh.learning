#!/usr/bin/env bash

for i in *\ *
do
	mv "$i" "${i//\ /_}"
	echo -e $i "-> Done :-)\n"
done
