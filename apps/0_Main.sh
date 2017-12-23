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
## Menú principal para instalar aplicaciones desde el que se permite
## elegir entre los tipos de aplicaciones a instalar desde un menú
## interactivo seleccionando el número que le corresponda

############################
##     IMPORTACIONES      ##
############################
source "$WORKSCRIPT/apps/1_Aplicaciones_Basicas.sh"
source "$WORKSCRIPT/apps/2_Aplicaciones_Extras.sh"
source "$WORKSCRIPT/apps/3_Aplicaciones_Usuario.sh"
source "$WORKSCRIPT/apps/bashit.sh"
source "$WORKSCRIPT/apps/i3wm.sh"
source "$WORKSCRIPT/apps/vim.sh"

###########################
##       FUNCIONES       ##
###########################
menuAplicaciones() {
    local descripcion='Menú de aplicaciones
        1) Aplicaciones Básicas
        2) Aplicaciones Extras
        3) Aplicaciones de Usuario
    '
    opciones "$descripcion"

    ## Llama al instalador de Bash-it
    bashit_Instalador

    ## Llama al instalador del gestor de ventanas i3wm
    i3wm_Instalador

    ## Llama al instalador y configurador de vim
    vim_Instalador
}
