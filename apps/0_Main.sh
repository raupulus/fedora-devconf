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
## Menú principal para instalar aplicaciones desde el que se permite
## elegir entre los tipos de aplicaciones a instalar desde un menú
## interactivo seleccionando el número que le corresponda

############################
##     IMPORTACIONES      ##
############################
source "$DIR_ACTUAL/apps/1_Aplicaciones_Basicas.sh"
source "$DIR_ACTUAL/apps/2_Aplicaciones_Extras.sh"
source "$DIR_ACTUAL/apps/3_Aplicaciones_Usuario.sh"
source "$DIR_ACTUAL/apps/bashit.sh"
source "$DIR_ACTUAL/apps/i3wm.sh"
source "$DIR_ACTUAL/apps/vim.sh"

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
## Llama al instalador de Bash-it
bashit_Instalador

## Llama al instalador del gestor de ventanas i3wm
i3wm_instalación
