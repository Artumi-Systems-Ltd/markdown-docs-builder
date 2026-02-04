#!/usr/bin/env bash

# Usage: ./create_doc.sh project_name

set -e # Exit on any error

# Check arguments
if [ $# -ne 1 ]; then
  echo "Usage: $0 <directory_name>"
  exit 1
fi

DIR="$1"
SOURCE="${BASH_SOURCE[0]}"
while [ -L "$SOURCE" ]; do
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$(dirname "${BASH_SOURCE[0]}")/$SOURCE"
done
SCRIPT_DIR="$(cd "$(dirname "$SOURCE")" && pwd)"
CODE_DIR="$SCRIPT_DIR" # Directory where Makefile and template are stored
TEMPLATE="$CODE_DIR/template.md"

# Create main directory
mkdir -p "$DIR"
echo "Created directory: $DIR"

# Copy Makefile
cp "$CODE_DIR/Makefile" "$DIR/"
echo "Copied Makefile to $DIR/"

# Create images directory
mkdir -p "$DIR/images"
echo "Created images directory: $DIR/images"

# Create markdown file from template
MD_FILE="$DIR/$(basename "$DIR").md"
if [ -f "$TEMPLATE" ]; then
  cp "$TEMPLATE" "$MD_FILE"
  echo "Created markdown file from template: $MD_FILE"
else
  # If template doesn't exist, create an empty file with a header
  echo "# $(basename "$DIR")" >"$MD_FILE"
  echo "Template not found. Created empty markdown file: $MD_FILE"
fi

echo "Setup complete!"
