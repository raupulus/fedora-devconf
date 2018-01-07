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
fuentes_repositorios() {
    instalarSoftware "linux-libertine-fonts-common" "anka-coder-fonts-common"
}

fuentes_externas() {
    for f in $WORKSCRIPT/Personalizar/fonts/*; do
        echo $f
            echo -e "$VE Instalando fuente$MA →$RO $f$CL"
            sudo cp -r "$f" '/usr/share/fonts/'
    done
}
###########################
##       EJECUCIÓN       ##
###########################
fuentes_instalador() {
    echo -e "$VE Añadiendo fuentes Tipográficas al sistema$CL"
    fuentes_repositorios
    fuentes_externas
}
