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
vim_descargar() {
    ## Descarga e instala el Gestor de Plugins Vundle
    vundle_descargar() {
        echo -e "$VE Descargando Vundle desde Repositorios"
        if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
            for (( i=1; i<=10; i++ )); do
                if [[ $i -eq 10 ]]; then
                    rm -R "$HOME/.vim/bundle/Vundle.vim" 2>> /dev/null
                    break
                fi
                git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim" && break
            done
        else
            echo -e "$RO Vundle$VE ya está instalado$CL"
        fi
}

vim_preconfiguracion() {
    echo -e "$VE Generando Pre-Configuraciones de$RO Vim$CL"
}

vim_instalar() {
    echo -e "$VE Instalando$RO Vim Pluginst$CL"
    vim_plugins() {
        plugins_vim=("align closetag powerline youcompleteme xmledit autopep8 python-jedi python-indent utilsinps utl rails snippets fugitive ctrlp tlib tabular sintastic detectindent closetag align syntastic")
        for plugin in $plugins_vim; do
            echo -e "$VE Activando el plugin →$RO $plugin $yellow"
            vim-addon-manager install "$plugin" >> /dev/null 2>> /dev/null
            vim-addon-manager enable "$plugin" >> /dev/null 2>> /dev/null
        done
        echo -e "$VE Todos los plugins activados$CL"
    }

    vim_plugins
}

vim_postconfiguracion() {
    echo -e "$VE Generando Post-Configuraciones$RO Vim$CL"
    echo | vim +PluginInstall +qall

    vim_colores() {
        mkdir -p ~/.vim/colors 2>> /dev/null

        ## Creando archivos de colores, por defecto usara "monokai"
        echo -e "$VE Descargando colores para sintaxis$AM"

        if [[ ! -f "$HOME/.vim/colors/wombat.vim" ]]; then
            wget 'http://www.vim.org/scripts/download_script.php?src_id=6657' -O "$HOME/.vim/colors/wombat.vim"
        fi

        echo -e "$VE Descargando Tema$RO Monokai$AM"
        if [[ ! -f "$HOME/.vim/colors/monokai1.vim" ]]; then
            wget 'https://raw.githubusercontent.com/lsdr/monokai/master/colors/monokai.vim' -O "$HOME/.vim/colors/monokai_1.vim"
        fi
        echo -e "$VE Se ha concluido la instalacion de temas de colores$CL"
    }

    vim_colores
}

###########################
##       EJECUCIÓN       ##
###########################
vim_Instalador() {
    vim_descargar
    vim_preconfiguracion
    vim_instalar
    vim_postconfiguracion
}
