#!/bin/bash

# Define ANSI color codes
folder_colors=(
  "\033[31m" "\033[32m" "\033[33m" "\033[34m" "\033[35m" "\033[36m"
  "\033[91m" "\033[92m" "\033[93m" "\033[94m" "\033[95m" "\033[96m"
)
file_color="\033[90m"  # Gray for spooky file names
reset="\033[0m"

# Map folders to random colors
declare -A folder_palette

# Assign a random color to a folder
assign_color() {
  local folder="$1"
  folder_palette["$folder"]=${folder_colors[$((RANDOM % ${#folder_colors[@]}))]}
}

# Recursive tree printer
print_tree() {
  local dir="$1"
  local prefix="$2"

  # Assign color if not already assigned
  if [[ -z "${folder_palette[$dir]}" ]]; then
    assign_color "$dir"
  fi

  # Print folder name with its color
  echo -e "${prefix}${folder_palette[$dir]}📁 $(basename "$dir")${reset}"

  # Iterate over contents
  local item
  for item in "$dir"/*; do
    [[ -e "$item" ]] || continue
    if [[ -d "$item" ]]; then
      print_tree "$item" "$prefix│   "
    else
      echo -e "${prefix}│   💀 ${file_color}$(basename "$item")${reset}"
    fi
  done
}

# Start from current directory or argument
start_dir="${1:-.}"
print_tree "$start_dir" ""
