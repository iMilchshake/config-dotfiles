#!/bin/bash

# Check if 'venv' virtual environment exists, otherwise create it
if [ ! -d "venv" ]; then
    python -m venv venv
fi

# Install required packages directly using venv's pip
venv/bin/pip install \
	i3ipc \
	fontawesome
