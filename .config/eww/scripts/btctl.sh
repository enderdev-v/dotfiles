#!/bin/bash

if [[ -z $(eww active-windows | grep 'btctl') ]]; then
    /usr/bin/eww open btctl && /usr/bin/eww update btctlrev=true
else
    /usr/bin/eww update btctlrev=false && /usr/bin/eww update btconfigrev=false
    (sleep 0.2 && /usr/bin/eww close btctl) &
fi
