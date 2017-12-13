function i3wm_dependencias() {
    echo "Instalando Dependencias"
    $dependencias="i3 i3status dmenu i3lock xbacklight feh"
    for x in $dependencias
    do
        echo "Instalando $x"
        sudo dnf install $x
    done
}

function i3wm_instalación() {
    i3wm_dependencias
}
