#!/bin/bash

# Aseguramos que siempre use el binario correcto
EWW="/usr/bin/eww"

# Comprobamos si la ventana está activa
if [[ -z $($EWW active-windows | grep 'menuctl') ]]; then
    $EWW open menuctl
    $EWW update menurev=true
else
    $EWW update menurev=false
    # Esperamos a que termine la animación (350ms definidos en tu .yuck) antes de matar la ventana
    (sleep 0.35 && $EWW close menuctl) &
fi