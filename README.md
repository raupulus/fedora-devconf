# Fedora_Developer_Init
## Script en desarrollo
### No usar en el estado actual

Instala todo el software y añade configuraciones personalizadas al sistema operativo y el usuario de forma que implementa un entorno para desarrollar aplicaciones web sin apenas intervención manual, ahorrando de esta forma mucho tiempo en preparar el sistema.

Por otro lado, las configuraciones que aplico en un equipo se encuentran disponibles en otros equipos solo con actualizar el repositorio. De esta forma puedo llevar mejor control de los cambios y disfrutar de personalización en todos los equipos por igual.

Probablemente haya cosas que prefieras de otra forma, para ello aún planteo un mecanismo que permita seleccionar esta serie de preferencias. Por el momento no es así y le invito a colaborar, reportar errores o abrir debate con sugerencias si lo desea.


## Objetivos
- El objetivo principal de este repositorio es establecer un entorno para trabajar rápidamente con la simple ejecución de un script, incluyendo una capa de personalización para el usuario que ha ejecutado el script.

- La capa de configuración quedará dentro del repositorio, en el directorio "conf" para que al actualizarlo podamos disfrutar las mejoras añadidas.

- Las copias de seguridad quedarán dentro del directorio "Backups" del repositorio, será generado en local y está excluido para no interferir en el repositorio.

- Plantear repositorios, software básico de cara a desarrollar aplicaciones web
- Lenguajes a preparar → bash, python, php, nodejs
- Servidores a preparar → html, ftp, ssh, php

## Advertencias
Este script realiza por defecto algunas tareas que pueden modificar el sistema de forma distinta a la que te gustaría. Esto no tiene por que ser del todo catastrófico, pero tienes que tener en cuenta que realiza modificaciones en los repositorios y sobre todo conocer que automáticamente se aprobarán todas las acciones para el gestor de paquetes (sudo dnf install -y) para no tener que estar constantemente aprobando descargas. Está decisión ha sido valorada teniendo en cuenta muchos factores y llegando a la decisión de que así es lo más eficiente tras un pequeño porcentaje de error. No deberá ocurrir ningún error mientras no tengas repositorios o programas externos que entren en conflicto (si solo usas repositorios oficiales y/o rpmfusion el riesgo es demasiado bajo ya que se trabaja precisamente con ellos)

## Exclusiones
- No se establece ninguna configuración para hardware como tarjetas gráficas.

## A Tener en cuenta
- Este repositorio forma parte de la configuración para el usuario una vez instalado, por tanto tendrá que permanecer siempre en el equipo ya que si lo borras se perderá. No lo borres cuando termines de instalar.
- Se aplicarán instalaciones de programas autoaceptadas (Si a todo)
- Actualiza el script cada cierto tiempo (cd Fedora_Developer_Init && git pull origin master)
- La configuración de programas se aplicara solo al usuario que ejecuta el script, si queremos varios usuarios se deberá ejecutar una vez con cada uno de ellos.
- No ejecutar como **root** (no utilizar **sudo**) ya que la personalización se quedará en su directorio personal (a menos que así lo deseas, en cuyo caso es interesante) y las acciones necesarias como administrador pedirán permiso  cuando sea necesario.

## Estructura
- Contenido actualizable mediante git pull
- Cada archivo enlaza a otro para que el usuario lo personalice

## Instalación
Asegurate de estar utilizando bash para ejecutar este script, en caso contrario entra en **bash** pues este es el intérprete para el que se ha programado.
Modo de instalación tomando el directorio "home" del usuario actual:
```bash
    ## Clonar repositorio en nuestro directorio principal de usuario
    git clone https://github.com/fryntiz/Fedora_Developer_Init "$HOME/Fedora_Developer_Init"

    ## Entrar al repositorio descargado
    cd "$HOME/Fedora_Developer_Init"

    ## Iniciar desde el script principal
    ./main.sh
```

También es posible realizar todo lo anterior en una sola orden:
```bash
    git clone https://github.com/fryntiz/Fedora_Developer_Init "$HOME/Fedora_Developer_Init" && cd "$HOME/Fedora_Developer_Init" && ./main.sh
```

## Guía de estilos
Esta serie de script siguen un patrón de estilos definido en mi propia guía de estilos para bash.

Dicha guía puedes consultarla en la siguiente dirección: https://github.com/fryntiz/Bash_Style_Guide
