#!/bin/sh

# Check if a device is connected by bluetooth using bluetoothctl
info=$(bluetoothctl devices Connected | grep Device)
device_name=$(echo "$info" | cut -d ' ' -f 3-)

# Show some output when it is
if echo "$info" | grep -q "Device"; 
then
    # Connected to a device
    echo '' $device_name
else 
    # Not connected to a device, hide label
    echo ''
fi
