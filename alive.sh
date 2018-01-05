#!/bin/bash

#Script para la verificacion de maquinas vivas en uno (o mas) segmentos de red

#Pre-requisitos
#
#Tener instalado NMap
#
#Privilegios de lecto/escritura en las rutas que se pasan como parametro
#
#Los directorios deben estar creados

#Se puede programar desde cron, simplemente suprimiendo las lineas donde se piden los parametros y grabando las rutas en el codigo


#***Comienzo del script***#

#Definicion de la ruta donde se ubican los binarios (des-comentar para usar con cron)
#SHELL=/bin/sh PATH=/bin:/sbin:/usr/bin:/usr/sbin

#Captura de la lista de entrada
#Comentar o eliminar esto si se va a usar con cron
echo "Digite la ruta completa donde se almacena la lista de rangos de IPs a escanear"
read lista_entrada

#Captura de la ruta de almacenamiento
#Comentar o eliminar esto si se va a usar con cron
echo "Digite la ruta donde se van a almacenar los resultados"
read ruta_almacena

#Obtencion de Fecha (Formato ISO-8601) con nanosegundos
dateandtime=$(date +%Y-%m-%d_%T.%N)

#Escaneo "ping-sweep" para detectar que maquinas hay vivas en los segmentos de red que se le pasan como parametro
nmap -sP -iL $lista_entrada -oN $ruta_almacena/$dateandtime.alive
#Comentar la linea anterior y des-comentar la siguiente si se va a usar con cron (ajustar la ubicacion del binario de nmap)
#Validar la ubicacion del binario de NMap para la distribucion que se esta utilizando, eso se hace con el comando: which nmap
#Luego utilizar la salida de dicho comando como base de la linea de abajo.
#/usr/bin/nmap -sP -iL ruta_completa_donde_se_ubica_la_lista -oN ruta_completa_donde_se_almacenaran_los_archivos/$dateandtime.alive

#***Fin del script***#
