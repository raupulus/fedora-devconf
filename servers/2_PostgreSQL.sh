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
postgresql_preconfiguracion() {
    echo -e "$VE Generando Pre-Configuraciones de$RO PostgreSQL$CL"
}

postgresql_instalar() {
    echo -e "$VE Instalando$RO PostgreSQL$CL"
    sudo apt install -y postgresql postgresql-client >> /dev/null 2>> /dev/null
    sudo apt install -y postgresql-contrib >> /dev/null 2>> /dev/null
    sudo apt install -y postgresql-all >> /dev/null 2>> /dev/null
}

postgresql_postconfiguracion() {
    echo -e "$VE Generando Post-Configuraciones$RO PostgreSQL$CL"

    POSTGRESCONF="/etc/postgresql/9.6/main/postgresql.conf"  # Archivo de configuración para postgresql

    echo -e "$verde Estableciendo intervalstyle = 'iso_8601'$gris"
    sudo sed -r -i "s/^\s*#?intervalstyle\s*=/intervalstyle = 'iso_8601' #/" $POSTGRESCONF

    echo -e "$verde Estableciendo timezone = 'UTC'$gris"
    sudo sed -r -i "s/^\s*#?timezone\s*=/timezone = 'UTC' #/" $POSTGRESCONF

    echo -e "$verde Personalizando SQL$gris"
    #sudo -u postgres createdb basedatos #Crea la base de datos basedatos
    #sudo -u postgres createuser -P usuario #Crea el usuario usuario y pide que teclee su contraseña

    ## Reiniciar servidor postgresql al terminar
    sudo systemctl restart postgresql
}

###########################
##       EJECUCIÓN       ##
###########################
postgresql_Instalador() {
    postgresql_preconfiguracion
    postgresql_instalar
    postgresql_postconfiguracion
}
