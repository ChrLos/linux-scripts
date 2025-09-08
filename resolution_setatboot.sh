#!/bin/bash

delete_prev_settings() {
	sed -i "/xrandr --output .* --mode .*/Id" ~/.xsession
	sed -i "/xrandr --output .* --mode .*/Id" ~/.xinitrc
}

change_settings() {
	clear

	echo "Choose From The Following Display and Resolution:"
	
	echo
	xrandr -q
	echo

	read -p "Type Your Display Name: " display_name
	read -p "Type Your Desired Resolution: " resolution

	resolution_command="xrandr --output $display_name --mode $resolution"

	sed -i "1i$resolution_command" ~/.xsession
	sed -i "1i$resolution_command" ~/.xinitrc #Fallback incase .xsession doesn't work
}

check_settings() {
	if [ $(grep -cE "xrandr --output .* --mode .*" ~/.xsession) -gt 0 ] || [ $(grep -cE "xrandr --output .* --mode .*" ~/.xinitrc) -gt 0 ]; then
		echo "Settings already exist"
		read -p "Do you want to change it? (Y/n): " user_answer
    user_answer=${user_answer:-y}

		if [ "$user_answer" == "y" ]; then
			delete_prev_settings	
			change_settings
		fi

		exit
	fi
}

check_settings
change_settings
