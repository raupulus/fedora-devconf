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
##
##             Guía de estilos aplicada:
## @style      https://github.com/fryntiz/Bash_Style_Guide

############################
##     INSTRUCCIONES      ##
############################

############################
##     IMPORTACIONES      ##
############################
source "$DIR_ACTUAL/conf/1_Configuraciones_Basicas.sh"
source "$DIR_ACTUAL/conf/2_Configuraciones_Extras.sh"
source "$DIR_ACTUAL/conf/3_Configuraciones_Usuario.sh"
source "$DIR_ACTUAL/conf/git.sh"

############################
##       CONSTANTES       ##
############################

###########################
##       VARIABLES       ##
###########################

###########################
##       FUNCIONES       ##
###########################

###########################
##       EJECUCIÓN       ##
###########################
# Llama a la configuración de GIT
#configuracion_git

# Llama a configurar usuario
configurar_Usuario
