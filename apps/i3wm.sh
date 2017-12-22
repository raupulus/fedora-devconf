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

############################
##       CONSTANTES       ##
############################

###########################
##       VARIABLES       ##
###########################

###########################
##       FUNCIONES       ##
###########################
i3wm_dependencias() {
    echo -e "$VE Instalando Dependencias$CL"
    dependencias='i3 i3-ipc i3lock i3status python2-i3ipc python3-i3ipc dmenu xbacklight feh mc links'

    instalarSoftware "$dependencias"
}

###########################
##       EJECUCIÓN       ##
###########################
i3wm_Instalador() {
    i3wm_dependencias
}
