#!/bin/sh

exec swayidle -w \
  timeout 300 'pidof hyprlock || hyprlock' \
  timeout 600 'niri msg action power-off-monitors' \
  resume 'niri msg action power-on-monitors' \
  before-sleep 'pidof hyprlock || hyprlock'
