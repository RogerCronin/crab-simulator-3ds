#!/usr/bin/env bash

# Check if size argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <size>"
  exit 1
fi

SIZE="$1"

INPUT_DIR="./assets_nest"
OUTPUT_DIR="./assets_3ds"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

rm -f ./assets_3ds/*.bcfnt
# Loop through all .ttf files
for file in "$INPUT_DIR"/*.ttf; do
  # Skip if no files match
  [ -e "$file" ] || continue

  filename=$(basename "$file" .ttf)

  /opt/devkitpro/tools/bin/mkbcfnt "$file" -s "$SIZE" -o "$OUTPUT_DIR/$filename.bcfnt"
done
