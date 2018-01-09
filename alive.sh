#!/bin/bash

#Script for check alive machines in one or more network segments

#Pre-requisites
#
#NMap installed, configured and functional
#
#R/W permissions on the paths used by this script
#
#The directories must exist prior to the execution of the script

#Note: Cron must be used to execute this script, only comment the lines where the parameters ar asked


#***Script start***#

#Binary path declaration (un-comment for cron use)
#SHELL=/bin/sh PATH=/bin:/sbin:/usr/bin:/usr/sbin

#Input list capture
#Comment or delte for cron use
echo "Type the complete path to the input list of network segments"
read lista_entrada

#Save path capture
#Comment or delte for cron use
echo "Type the complete path where the results where saved"
read ruta_almacena

#DateTime adquisition (Format ISO-8601) with nanoseconds
dateandtime=$(date +%Y-%m-%d_%T.%N)

#Ping-sweep scan for search if a machine is alive or not in the defined segments (input list)
nmap -sP -iL $lista_entrada -oN $ruta_almacena/$dateandtime.alive
#Comment the last line an un-comment the next one if it while be used by cron
#/usr/bin/nmap -sP -iL ruta_completa_donde_se_ubica_la_lista -oN ruta_completa_donde_se_almacenaran_los_archivos/$dateandtime.alive
#Validate the exact location of NMap binary (which nmap) and replace (if necessary) in the last line, un-comment to use with cron

#***Script end***#
