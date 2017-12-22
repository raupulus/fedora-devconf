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
function home() {
    # Mover al directorio Backups el archivo .bashrc
    if [ -f "$HOME/.bashrc" ]; then
        crearBackup "$HOME/.bashrc" && rm "$HOME/.bashrc"
    fi

    # Crear enlace
    ln -s "$DIR_ACTUAL/conf/home/bashrc" "$HOME/.bashrc"
}

function configurar_Usuario() {
    home
}

###########################
##       EJECUCIÓN       ##
###########################
