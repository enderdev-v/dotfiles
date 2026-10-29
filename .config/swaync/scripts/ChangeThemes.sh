#!/bin/bash

/home/enderdev/.config/swaync/scripts/ChangeTheme.bin 
/home/enderdev/.config/swaync/scripts/ChangeThemeSway.bin
/home/enderdev/.config/swaync/scripts/ChangeThemekitty.bin

killall -9 swaync

swaync > /dev/null 2>&1 &

disown

sleep 5

notify-send "Tema Configurado" "Se ha cambiado el tema del sistema"    