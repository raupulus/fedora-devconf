#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#######################################
# ###     Raúl Caro Pastorino     ### #
## ##                             ## ##
### # https://github.com/fryntiz/ # ###
## ##                             ## ##
# ###       www.fryntiz.es        ### #
#######################################

############################
##       Constantes      ##
############################
DIR_ACTUAL=`echo $PWD`


# Crea un respaldo del archivo o directorio pasado como parámetro
function crearBackup() {
    for salvando in $*
    do
        if [ -f $salvando ]; then
            echo "Creando Backup del archivo $salvando"

        elif [ -d $salvando ]; then
            echo "Creando Backup del directorio $salvando"
        else
            echo "No se encuentra $salvando"
        fi
    done
}
