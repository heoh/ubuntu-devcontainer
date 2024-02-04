#!/bin/bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

$SCRIPT_DIR/devcont/install.sh

# Set locale
. devcont-export LANG=C.UTF-8
. devcont-export LC_ALL=C.UTF-8

echo -e '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d

apt update
apt install -y dumb-init
