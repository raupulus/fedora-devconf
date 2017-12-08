#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#######################################
# ###     Raúl Caro Pastorino     ### #
## ##                             ## ##
### # https://github.com/fryntiz/ # ###
## ##                             ## ##
# ###       www.fryntiz.es        ### #
#######################################

function home() {
    # Mover al directorio Backups el archivo .bashrc
    if [ -f "$HOME/,bashrc" ]; then
        crearBackup "$HOME/.bashrc" && rm "$HOME/.bashrc"
    fi

    # Crear enlace
    ln -s "$DIR_ACTUAL/conf/home/bashrc $HOME/.bashrc"
}

function configurar_Usuario() {
    home
}
