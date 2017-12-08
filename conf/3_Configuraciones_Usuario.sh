
function home() {
    # Mover al directorio Backups el archivo .bashrc
    if [ -f "$HOME/,bashrc" ]; then
        crearBackup "$HOME/.bashrc" && rm $HOME/.bashrc
    fi

    # Crear enlace
    ln -s "$DIR_ACTUAL/conf/home/bashrc $HOME/.bashrc"
}
