#!/bin/bash

#Script for make basic permutations on a list of words
#UPPERCASE
#lowercase
#nospaces
#no special chars
#l33t

#***Script start***

#for i in {1..99999999}
#	do
	#echo $i | md5sum | awk '{print $1}'
#	echo $i 
#done
#Define counter
i=0

#Capture the original file containing the list of words
echo "Please type the full path to the word list"
read wordlist

#Size of the original dictionary
size=$(wc -l $wordlist | awk  -F " " '{print$0}')
echo "The original dictionary has: "$size" words"

#Capture the name of the file to save the dictionary
echo "Please type the name of the Dictionary"
read def_dict

#Create the definitive dictionary containing the original list
cat $wordlist > $def_dict

#In all conversions, the specials chars must be supressed prior to the conversion

#Change case to UPPER
echo "Begin of the change case to UPPER process"
for f in $wordlist
do
	while read line;
	do
		echo $line | iconv -f utf8 -t ascii//TRANSLIT//IGNORE | tr '[:upper:]' '[:lower:]' >> $def_dict
		i=$((i+1))
		#Supress spaces to this new set
		echo $line | iconv -f utf8 -t ascii//TRANSLIT//IGNORE | tr '[:upper:]' '[:lower:]' | tr -d '[:blank:]'  >> $def_dict
		i=$((i+1))
	done
		echo "The dictionary has: "$i" new words"
done < "$wordlist"

i=0
#Change case to lower
echo "Begin of the change case to lower process"
for f in $wordlist
do
	while read line;
	do
		echo $line |  iconv -f utf8 -t ascii//TRANSLIT//IGNORE | tr '[:lower:]' '[:upper:]' >> $def_dict
		i=$((i+1))
		#Supress spaces to this new set
		echo $line |  iconv -f utf8 -t ascii//TRANSLIT//IGNORE | tr '[:lower:]' '[:upper:]' | tr -d '[:blank:]' >> $def_dict
		i=$((i+1))
	done
		echo "The dictionary has: "$i" new words"
done < "$wordlist"

i=0
#Supress spaces
echo "Begin of the supress spaces process"
for f in $wordlist
do
	while read line;
	do
		echo $line |  iconv -f utf8 -t ascii//TRANSLIT//IGNORE | tr -d '[:blank:]' >> $def_dict
		i=$((i+1))
	done
		echo "The dictionary has: "$i" new words"
done < "$wordlist"

i=0
#Supress special chars
echo "Begin of the supress special chars process"
for f in $wordlist
do
	while read line;
	do
		echo $line |  iconv -f utf8 -t ascii//TRANSLIT//IGNORE >> $def_dict
		i=$((i+1))
		#Supress spaces to this new set
		echo $line |  iconv -f utf8 -t ascii//TRANSLIT//IGNORE | tr -d '[:blank:]' >> $def_dict
		i=$((i+1))
	done
		echo "The dictionary has: "$i" new words"
done < "$wordlist"

i=0
#L33t
echo "Begin of the l33t encode process"
for f in $wordlist
do
	while read line;
	do
		echo $line |  iconv -f utf8 -t ascii//TRANSLIT//IGNORE | tr '[:upper:]' '[:lower:]' | tr 'a' '4' | tr 'e' '3' | tr 'i' '1' | tr 'o' '0' | tr 'g' '6' | tr 's' '5' | tr 't' '7' >> $def_dict
		i=$((i+1))
		#Supress spaces to this new set
		echo $line |  iconv -f utf8 -t ascii//TRANSLIT//IGNORE | tr '[:upper:]' '[:lower:]' | tr 'a' '4' | tr 'e' '3' | tr 'i' '1' | tr 'o' '0' | tr 'g' '6' | tr 's' '5' | tr 't' '7' | tr -d '[:blank:]' >> $def_dict
		i=$((i+1))
	done
		echo "The dictionary has: "$i" new words"
done < "$wordlist"

#Discard duplicated words
cat $def_dict | sort | uniq > 1.txt
mv 1.txt $def_dict

final=$(wc -l $def_dict | awk -F " " '{print $1}')
echo "The definitive dictionary has: "$final" words"
#***Script end***
