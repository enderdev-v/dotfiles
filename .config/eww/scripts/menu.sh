#!/bin/bash

names=(
  "Brave Browser"
  "OBS Studio"
  "Spotify"
  "Vesktop"
  "Arduine-IDE"
)

execs=(
  "brave"
  "obs"
  "spotify-launcher %U"
  "vesktop"
  "arduino-ide"
)

icons=(
  "/usr/share/icons/hicolor/128x128/apps/brave-desktop.png"
  "/usr/share/icons/hicolor/256x256/apps/com.obsproject.Studio.png"
  "/usr/share/icons/hicolor/512x512/apps/spotify-launcher.png"
  "/home/enderdev/Pictures/icons/image.png"
  "/usr/share/icons/hicolor/512x512/apps/arduino-ide-v2.png"
)

terminal=(
  false # brave
  false # obs
  false # spotify
  false # vesktop
  false # arduino-ide
)

json="["

for i in "${!names[@]}"; do
  [[ $i -ne 0 ]] && json+=","
  json+="{\"name\":\"${names[$i]}\",\"exec\":\"${execs[$i]}\",\"icon\":\"${icons[$i]}\",\"terminal\":\"${terminal[$i]}\"}"
done

json+="]"
echo "$json"
