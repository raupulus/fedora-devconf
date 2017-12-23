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
    echo -e "$VE Descargando componentes para instalar VIM"
}

vim_preconfiguracion() {
    echo -e "$VE Generando Pre-Configuraciones de$RO Vim$CL"
    enlazarHome '.vim' '.vimrc' '.gvimrc'

    ## Descarga e instala el Gestor de Plugins Vundle
    descargarGIT 'Bundle' 'https://github.com/VundleVim/Vundle.vim.git' "$HOME/.vim/bundle/Vundle.vim"
}

vim_instalar() {
    echo -e "$VE Instalando$RO Vim Plugins$CL"
    vim_plugins() {
        plugins_vim="align closetag powerline youcompleteme xmledit autopep8 python-jedi python-indent utilsinps utl rails snippets fugitive ctrlp tlib tabular sintastic detectindent closetag align syntastic"
        for plugin in $plugins_vim; do
            echo -e "$VE Activando el plugin →$RO $plugin $AM"
            vim-addon-manager install "$plugin" >> /dev/null 2>> /dev/null
            vim-addon-manager enable "$plugin" >> /dev/null 2>> /dev/null
        done
        echo -e "$VE Todos los plugins activados$CL"
    }

    ## Instalar dependencias
    local dependencias="vim-powerline docker-vim fluxbox-vim-syntax vim-go vim-latex vim-perl-support vim-powerline vim-pysmell vim-syntastic vim-syntastic-css vim-syntastic-elixir vim-syntastic-eruby vim-syntastic-go vim-syntastic-haskell vim-syntastic-html vim-syntastic-json vim-syntastic-javascript vim-syntastic-less vim-syntastic-lex vim-syntastic-perl vim-syntastic-php vim-syntastic-python vim-syntastic-ruby vim-syntastic-sh vim-syntastic-tex vim-syntastic-vim vim-syntastic-xhtml vim-syntastic-xml vim-syntastic-zsh vim-vimoutliner perl-Text-VimColor"

    instalarSoftware "$dependencias"

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
