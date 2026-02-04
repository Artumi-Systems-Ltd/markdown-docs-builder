#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMMAND="$SCRIPT_DIR/new-doc.sh"

ln -s $COMMAND ~/bin/new-doc.sh
