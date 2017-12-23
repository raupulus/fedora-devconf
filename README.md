# Fedora_Developer_Init
## Script en desarrollo
### No usar en el estado actual

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

## Estructura
-
- Contenido actualizable mediante git pull
- Cada archivo enlaza a otro para que el usuario lo personalice
