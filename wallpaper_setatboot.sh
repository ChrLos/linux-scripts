sudo nala install feh -y

delete_prev_settings() {
	sed -i "/feh --bg-fill .*/Id" ~/.xsession
	sed -i "/feh --bg-fill .*/Id" ~/.xinitrc
}

change_settings() {
    read -p "Where is your background path location: " bg_location

    feh --bg-fill $bg_location

    sed -i "2ifeh --bg-fill $bg_location" ~/.xsession
    sed -i "2ifeh --bg-fill $bg_location" ~/.xinitrc

    feh --bg-fill $bg_location
}

check_settings() {
    if [ $(grep -cE "feh --bg-fill .*" ~/.xsession) -gt 0 ] || [ $(grep -cE "feh --bg-fill .*" ~/.xinitrc) -gt 0 ]; then
        echo "Wallpaper already set"
        read -p "do you want to change it? [y/n]: " user_answer

        if [ $user_answer == "y" ]; then
            delete_prev_settings
            change_settings
        fi

        exit
    fi
}

check_settings
change_settings