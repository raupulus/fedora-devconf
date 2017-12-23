#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2017 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      tecnico@fryntiz.es
## @web        www.fryntiz.es
## @github     https://github.com/fryntiz
## @gitlab     https://gitlab.com/fryntiz
## @twitter    https://twitter.com/fryntiz
##
##             Guía de estilos aplicada:
## @style      https://github.com/fryntiz/Bash_Style_Guide

############################
##     INSTRUCCIONES      ##
############################
## Este script tiene como objetivo ofrecer funciones recurrentes de
## forma auxiliar para todos los demás scripts.

###########################
##       FUNCIONES       ##
###########################
##
## Crea un respaldo del archivo o directorio pasado como parámetro
## @param  $*  Recibe una serie de elementos a los que crearle un backup
##
crearBackup() {
    for salvando in $*; do
        if [[ -f $salvando ]]; then
            echo "Creando Backup del archivo $salvando"
            cp "$salvando" "$WORKSCRIPT/Backups/"
        elif [[ -d $salvando ]]; then
            echo "Creando Backup del directorio $salvando"
            cp "$salvando" "$WORKSCRIPT/Backups/"
        else
            echo "No se encuentra $salvando"
        fi
    done
}

##
## Muestra el texto recibido como parámetro formateado por pantalla
## @param  $1  String  Recibe la cadena a pintar
##
opciones() {
    echo -e "$AZ Opciones Disponibles$CL"
    echo -e "$VE $1$CL"
}

##
## Recibe uno o más parámetros con el nombre de los programas a instalar
## @param  $*  String  Nombre de programas a instalar
##
instalarSoftware() {
    for programa in $*; do
        sudo dnf install -y "$programa"
    done
}

##
##
## @param  $1  String  Nombre del recurso a descargar (Añadir extensión)
## @param  $2  String  Origen de la descarga (Desde donde descargar)
##
descargar() {
    ## Comprobar que se reciben 3 parámetros
    ## Comprobar que no son cadenas vacías
    ## Comprobar que no son números

    echo -e "$VE Descargando$RO $1 $CL"
    local REINTENTOS=10
    for (( i=1; i<=$REINTENTOS; i++ ))
    do
        rm $WORKSCRIPT/tmp/$1 2>> /dev/null
        wget --show-progress "$2" -O "$WORKSCRIPT/tmp/$1" && break
    done
}
