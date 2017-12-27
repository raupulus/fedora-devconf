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


    function personalizar_apache() {
        echo -e "$verde Personalizando$rojo Apache2$gris"
        function generar_www() {
            mi_usuario=`whoami`

            # Borrar contenido de /var/www
            sudo systemctl stop apache2
            echo -e "$verde Cuidado, esto puede$rojo BORRAR$verde algo valioso"
            read -p " ¿Quieres borrar todo el directorio /var/www/? s/N → " input
            if [ $input = 's' ] || [ $input = 'S' ]
            then
                sudo rm -R /var/www/*
            else
                echo -e "$verde No se borra /var/www$amarillo"
            fi

            # Copia todo el contenido WEB a /var/www
            echo -e "$verde Copiando contenido dentro de /var/www"
            sudo cp -R ./Apache2/www/* /var/www/

            # Copia todo el contenido de configuración a /etc/apache2
            echo -e "$verde Copiando archivos de configuración dentro de /etc/apache2"
            sudo cp -R ./Apache2/etc/apache2/* /etc/apache2/

            # Crear archivo de usuario con permisos para directorios restringidos
            echo -e "$verde Creando usuario con permisos en apache"
            sudo rm /var/www/.htpasswd 2>> /dev/null
            while [ -z $input_user ]
            do
                read -p "Nombre de usuario para acceder al sitio web privado → " input_user
            done
            echo -e "$verde Introduce la contraseña para el sitio privado:$rojo"
            sudo htpasswd -c /var/www/.htpasswd $input_user

            # Cambia el dueño
            echo -e "$verde Asignando dueños$gris"
            sudo chown www-data:www-data -R /var/www
            sudo chown root:root /etc/apache2/ports.conf

            # Agrega el usuario al grupo www-data
            echo -e "$verde Añadiendo el usuario al grupo$rojo www-data"
            sudo adduser $mi_usuario www-data
        }

        echo -e "$verde Es posible generar una estructura dentro de /var/www"
        echo -e "$verde Ten en cuenta que esto borrará el contenido actual"
        echo -e "$verde También se modificarán archivos en /etc/apache2/*$red"
        read -p " ¿Quieres Generar la estructura y habilitarla? s/N → " input
        if [ $input = 's' ] || [ $input = 'S' ]
        then
            generar_www
        else
            echo -e "$verde No se genera la estructura predefinida y automática"
        fi

        # Generar enlaces (desde ~/web a /var/www)
        function enlaces() {
            clear
            echo -e "$verde Puedes generar un enlace en tu home ~/web hacia /var/www/html"
            read -p " ¿Quieres generar el enlace? s/N → " input
            if [ $input = 's' ] || [ $input = 'S' ]
            then
                sudo ln -s /var/www/html/ /home/$mi_usuario/web
                sudo chown -R $mi_usuario:www-data /home/$mi_usuario/web
            else
                echo -e "$verde No se crea enlace desde ~/web a /var/www/html"
            fi

            clear
            echo -e "$verde Puedes crear un directorio para repositorios GIT en tu directorio personal"
            echo -e "$verde Una vez creado se añadirá un enlace al servidor web"
            echo -e "$verde Este será desde el servidor /var/www/html/Publico/GIT a ~/GIT$rojo"
            read -p " ¿Quieres crear el directorio y generar el enlace? s/N → " input
            if [ $input = 's' ] || [ $input = 'S' ]
            then
                mkdir ~/GIT 2>> /dev/null && echo -e "$verde Se ha creado el directorio ~/GIT" || echo -e "$verde No se ha creado el directorio ~/GIT"
                sudo ln -s /home/$mi_usuario/GIT /var/www/html/Publico/GIT
                sudo chown -R $mi_usuario:www-data /home/$mi_usuario/GIT
            else
                echo -e "$verde No se crea enlaces ni directorio ~/GIT"
            fi
        }

        enlaces

        # Cambia los permisos
        echo -e "$verde Asignando permisos"
        sudo chmod 775 -R /var/www/*
        sudo chmod 700 /var/www/.htpasswd
        sudo chmod 700 /var/www/html/Privado/.htaccess
        sudo chmod 700 /var/www/html/Publico/.htaccess
        sudo chmod 700 /var/www/html/Privado/CMS/.htaccess
        sudo chmod 755 /etc/apache2/ports.conf /etc/apache2/
        sudo chmod 755 -R /etc/apache2/sites-available /etc/apache2/sites-enabled

        # Habilita Sitios Virtuales (VirtualHost)
        sudo a2ensite default.conf
        sudo a2ensite publico.conf
        sudo a2ensite privado.conf

        # Deshabilita Sitios Virtuales (VirtualHost)
        sudo a2dissite 000-default.conf

        function activar_hosts() {
            echo -e "$verde Añadiendo Sitios Virtuales$amarillo"
            echo "127.0.0.1 privado" | sudo tee -a /etc/hosts
            echo "127.0.0.1 privado.local" | sudo tee -a /etc/hosts
            echo "127.0.0.1 p.local" | sudo tee -a /etc/hosts
            echo "127.0.0.1 publico" | sudo tee -a /etc/hosts
            echo "127.0.0.1 publico.local" | sudo tee -a /etc/hosts
        }

        read -p " ¿Quieres añadir sitios virtuales a /etc/hosts? s/N → " input
        if [ $input = 's' ] || [ $input = 'S' ]
        then
            activar_hosts
        else
            echo -e "$verde No se añade nada a /etc/hosts"
        fi
    }










apache2_preconfiguracion() {
    echo -e "$VE Generando Pre-Configuraciones de$RO Apache 2$CL"
}

apache2_instalar() {
    echo -e "$VE Instalando$RO Apache2$CL"
    instalarSoftware 'httpd' 'httpd-filesystem' 'httpd-tools' 'system-config-httpd' 'web-assets-httpd'


    #sudo apt install -y apache2 >> /dev/null 2>> /dev/null
    #sudo apt install -y libapache2-mod-perl2 >> /dev/null 2>> /dev/null
    #sudo apt install -y libapache2-mod-php >> /dev/null 2>> /dev/null
    #sudo apt install -y libapache2-mod-python >> /dev/null 2>> /dev/null
}

apache2_postconfiguracion() {
    echo -e "$VE Generando Post-Configuraciones$RO Apache2$CL"

    ## Activar Módulos
    echo -e "$verde Activando módulos$red"
    #sudo a2enmod rewrite

    ## Desactivar Módulos
    echo -e "$verde Desactivando módulos$red"
    #sudo a2dismod php5

    ## Reiniciar servidor Apache para aplicar configuración
    sudo systemctl start apache2
    sudo systemctl restart apache2
}
###########################
##       EJECUCIÓN       ##
###########################
apache2_Instalador() {
    apache2_preconfiguracion
    apache2_instalar
    apache2_postconfiguracion
}
