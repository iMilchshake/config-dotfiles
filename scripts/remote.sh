#!/bin/bash

pkill kdeconnectd
pkill kdeconnect-indi

# Start kdeconnect daemon
kdeconnectd &

# Start kdeconnect indicator
kdeconnect-indicator &

# Kill unclutter if running
pkill unclutter
