#!/bin/bash

if ! command -v pacman &> /dev/null; then
    echo "Error: This system is not Arch-based."
    exit 1
fi

input_file="./pkglist.txt"
temp_file=$(mktemp)
cp "$input_file" "$temp_file"
${EDITOR:-nano} "$temp_file"

# filter out commented and empty lines
filtered_content=$(grep -v '^\s*#' "$temp_file" | grep -v '^\s*$')

rm "$temp_file"

sudo pacman -S --needed $filtered_content
