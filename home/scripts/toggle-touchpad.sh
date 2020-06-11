#!/bin/zsh

ID=$(xinput --list  | grep -i synaptics | awk '{print $5}' | awk -F "="  '{print $2}')

if xinput list-props $ID | grep "Device Enabled (.*):.*1" >/dev/null
then
  xinput disable $ID
  dunstify -r 6662 "Trackpad disabled"
else
  xinput enable $ID
  echo enable
  dunstify -r 6662 "Trackpad enabled"
fi
