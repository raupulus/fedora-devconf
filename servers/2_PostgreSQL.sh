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
    instalarSoftware 'postgresql' 'postgresql-server' 'postgresql-contrib' 'postgresql-odbc' 'postgresql-plperl' 'postgresql-plpython' 'postgresql-plpython3' 'postgresql-pltcl' 'python3-postgresql' 'postgresql_autodoc' 'postgresql-static' 'phpPgAdmin' 'pgadmin3'

    ## Iniciar el servidor
    sudo systemctl start postgresql

    ## Crear base de datos
    #sudo postgresql-setup --initdb --unit postgresql
    ## En caso de fallar, necesitamos actualizar clúster
    #sudo postgresql-setup --upgrade --unit postgresql
}

postgresql_postconfiguracion() {
    echo -e "$VE Generando Post-Configuraciones$RO PostgreSQL$CL"

    POSTGRESCONF="/etc/postgresql/9.6/main/postgresql.conf"  # Archivo de configuración para postgresql

    echo -e "$verde Estableciendo intervalstyle = 'iso_8601'$gris"
    #sudo sed -r -i "s/^\s*#?intervalstyle\s*=/intervalstyle = 'iso_8601' #/" $POSTGRESCONF

    echo -e "$verde Estableciendo timezone = 'UTC'$gris"
    #sudo sed -r -i "s/^\s*#?timezone\s*=/timezone = 'UTC' #/" $POSTGRESCONF

    echo -e "$verde Personalizando SQL$gris"
    #sudo -u postgres createdb basedatos #Crea la base de datos basedatos
    #sudo -u postgres createuser -P usuario #Crea el usuario usuario y pide que teclee su contraseña

    ## Habilitar inicio automático
    sudo systemctl enable postgresql

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
