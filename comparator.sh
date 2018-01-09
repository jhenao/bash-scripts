#!/bin/bash

#Script para identificar si una direccion IP está o no en multiples archivos, a partir de una linea base

#Para almacenar el resultado se debe redirigir la ejecución del script a un archivo "./script.sh > archivo_salida"

#Prerequisitos
#
#Linea base con las IPs que se deben comparar
#
#Listado de archivos con las IPs a comparar

#***Comienzo del script***"

#Captura de la ubicacion del archivo de Linea base
echo "Digite la ruta completa al archivo de linea base"
read base

#Captura de la extension de los archivos a comparar (formato: *.extension)
echo "Digite la ruta y la extension de los archivos a comparar (el formato es: ruta/*.extension)"
read FILES

#Comienza la labor de comparacion
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
#***Fin del script***#
