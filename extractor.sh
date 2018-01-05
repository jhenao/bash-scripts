#!/bin/bash

#Script para obtener las direcciones IP desde un resultado de NMap una vez se ejecuta un ping-sweep

#Prerequisitos
#
#Contar con archivos resultado de un escaneo con la herramienta NMap (deben ser escaneo ping-sweep)

#***Comienzo del script***#

#Definicion del tipo de archivos a buscar
FILES=*.alive

#Recorrer lista de archivos *.alive
for f in $FILES
	do 
	filename1=$f
	extension=".alive"
	foo=${filename1%$extension}
	cat $filename1 | grep Nmap\ scan | awk '{print $5}' | sort | uniq > foo1/$foo.ips
done
#***Fin del script***#
