sudo nala install feh -y

delete_prev_settings() {
	sed -i "/feh --bg-fill .*/Id" ~/.xsession
	sed -i "/feh --bg-fill .*/Id" ~/.xinitrc
}

change_settings() {
    read -p "Where is your background image folder location: " bg_folder

    readarray -t bg_location < <(ls $bg_folder/*.{jpg,jpeg,png,webp,tif,tiff,bmp,heif,heic,avif})
    ls $bg_folder/*.{jpg,jpeg,png,webp,tif,tiff,bmp,heif,heic,avif} | awk '{print FNR". " $0}'
    read -p "Choose one for the background wallpaper: " user_answer

    set_wallpaper="feh --bg-fill ${bg_location[$user_answer - 1]}"

    $set_wallpaper

    sed -i "2i$set_wallpaper" ~/.xsession
    sed -i "2i$set_wallpaper" ~/.xinitrc
}

check_settings() {
    if [ $(grep -cE "feh --bg-fill .*" ~/.xsession) -gt 0 ] || [ $(grep -cE "feh --bg-fill .*" ~/.xinitrc) -gt 0 ]; then
        echo "Wallpaper already set"
        read -p "Do you want to change it? [Y/n]: " user_answer
        user_answer=${user_answer:-y}

        if [ $user_answer == "y" ]; then
            delete_prev_settings
            change_settings
        fi

        exit
    fi
}

check_settings
change_settings