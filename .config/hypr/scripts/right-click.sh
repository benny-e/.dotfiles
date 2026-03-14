#!/usr/bin/env bash
set -euo pipefail

theme="$HOME/.config/rofi/right-click.rasi"
pad=8

read -r gx gy <<<"$(hyprctl cursorpos -j | jq -r '[.x,.y] | @tsv')"

monitor_json="$(
  hyprctl monitors -j | jq -c --argjson gx "$gx" --argjson gy "$gy" '
    map(select(
      $gx >= .x and
      $gx < (.x + .width) and
      $gy >= .y and
      $gy < (.y + .height)
    )) | .[0]
  '
)"

[[ -z "$monitor_json" || "$monitor_json" == "null" ]] && exit 1

mx="$(jq -r '.x' <<< "$monitor_json")"
my="$(jq -r '.y' <<< "$monitor_json")"
mname="$(jq -r '.name' <<< "$monitor_json")"

lx=$(( ${gx%.*} - mx + pad ))
ly=$(( ${gy%.*} - my + pad ))

choice="$(
  printf '%s\n' \
    '󰑓 Reload Waybar' \
    ' Reload Hyprland' \
    '󰆞 Screenshot Area' \
    '󰹑 Screenshot Screen' \
    ' Terminal' \
  | rofi -dmenu -i \
      -hover-select \
      -monitor "$mname" \
      -theme "$theme" \
      -theme-str "window {
        location: northwest;
        anchor: northwest;
        x-offset: ${lx}px;
        y-offset: ${ly}px;
      }"
)"

case "$choice" in
  '󰑓 Reload Waybar')
    killall -SIGUSR2 waybar
    notify-send -a Waybar "Waybar reloaded"
    ;;
  ' Reload Hyprland')
    hyprctl reload
    notify-send -a Hyprland "Hyprland config reloaded"
    ;;
  '󰆞 Screenshot Area')
    grimblast copy area && notify-send -a Screenshot -i camera-photo "Area captured" "Copied to clipboard"
    ;;
  '󰹑 Screenshot Screen')
    grimblast copy screen && notify-send -a Screenshot -i camera-photo "Screen captured" "Copied to clipboard"
    ;;
  ' Terminal')
    kitty &
    ;;
esac
