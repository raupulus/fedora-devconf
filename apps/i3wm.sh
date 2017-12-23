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

}

i3wm_descargar() {
    echo -e "$VE Descargando i3wm desde Repositorios"
}

i3wm_preconfiguracion() {
    echo -e "$VE Generando Pre-Configuraciones de$RO i3wm$CL"
    enlazarHome '.i3'
}

i3wm_instalar() {
    echo -e "$VE Instalando$RO i3wm$CL"
    local dependencias='i3 i3-ipc i3lock i3status python2-i3ipc python3-i3ipc dmenu xbacklight feh mc links'

    instalarSoftware "$dependencias"
}

i3wm_postconfiguracion() {
    echo -e "$VE Generando Post-Configuraciones$RO i3wm$CL"
}
###########################
##       EJECUCIÓN       ##
###########################
i3wm_Instalador() {
    i3wm_descargar
    i3wm_preconfiguracion
    i3wm_instalar
    i3wm_postconfiguracion
}
