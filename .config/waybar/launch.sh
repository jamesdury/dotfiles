#!/usr/bin/env bash

# Terminate already running bar instances
killall -q waybar

# Wait until the processes have been shut down
while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done

waybar >>/tmp/waybar.log 2>&1 &

echo "Bars launched..."
