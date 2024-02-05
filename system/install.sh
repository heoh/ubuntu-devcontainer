#!/bin/bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

"$SCRIPT_DIR/ca-certificates/install.sh"
"$SCRIPT_DIR/s6-overlay/install.sh"
