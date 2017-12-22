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
## Menú principal que gestiona toda la aplicación mostrando un menú
## para seleccionar la acción que se desea tomar introduciendo el
## número asociado a esta.

############################
##       CONSTANTES       ##
############################
AM="\033[1;33m"  ## Color Amarillo
AZ="\033[1;34m"  ## Color Azul
BL="\033[1;37m"  ## Color Blanco
CY="\033[1;36m"  ## Color Cyan
GR="\033[0;37m"  ## Color Gris
MA="\033[1;35m"  ## Color Magenta
RO="\033[1;31m"  ## Color Rojo
VE="\033[1;32m"  ## Color Verde
CL="\e[0m"       ##Limpiar colores

WORKSCRIPT=$PWD  ## Directorio principal del script
USER=$(whoami)   ## Usuario que ejecuta el script

############################
##     IMPORTACIONES      ##
############################
source 'funciones.sh'
source 'apps/0_Main.sh'
source 'conf/0_Main.sh'
source 'servers/0_Main.sh'

###########################
##       VARIABLES       ##
###########################

###########################
##       FUNCIONES       ##
###########################
menuPrincipal() {
    local descripcion='Menú Principal
        1) Aplicaciones
        2) Configuraciones
        3) Personalización
        4) Servidores
    '
    opciones "$descripcion"

    ## Menú de Aplicaciones
    menuAplicaciones
}

###########################
##       EJECUCIÓN       ##
###########################
menuPrincipal
