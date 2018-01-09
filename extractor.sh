#!/bin/bash

#Script for obtain the list of IPs (Raw list) from a ping-sweep result of an NMap scanning

#Prerequisites
#
#Have the files of a ping-sweep scan, made with NMap

#***Script start***#

#Definition of the file extension
FILES=*.alive

#Read the list of files *.alive
for f in $FILES
	do 
	filename1=$f
	extension=".alive"
	foo=${filename1%$extension}
	cat $filename1 | grep Nmap\ scan | awk '{print $5}' | sort | uniq > foo1/$foo.ips
done
#***Script end***#
