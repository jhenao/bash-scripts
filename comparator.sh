#!/bin/bash

#Script used to identify if a IP is present in multiple files, compared to a baseline file.

#The script uses STOUT, to save the results they must be redirected to another file "./script.sh > output_file"

#Prerequisites
#
#Baseline with the IPs to compare
#List of files with the IPs to search

#***Script start***"

#Base line path capture
echo "Type the full path to the baseline file"
read base

#Extension capture
echo "Type the extension of the files to compare (the format is: path/*.extension)"
read FILES

#Start of compare
for f in $FILES
do
	while read line1; do
		if grep -qF "$line1" $base; then
			echo $line1 "YES"
		else 
			echo $line1 "NO"
		fi
	done < "$f"
done
#***Script end***#
