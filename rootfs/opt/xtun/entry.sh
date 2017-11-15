#!/bin/sh -e

NET=10.222.0.1/24

if [ -z "$XTUN_PSK" ]; then
  XTUN_PSK="$(LC_CTYPE=C tr -dc 'A-HJ-NPR-Za-km-z2-9' < /dev/urandom | head -c 16)" 
fi
source /opt/xtun/scripts/server_up.sh

cat <<EOF

================================================

xTun NET: $NET
xTun PSK: $XTUN_PSK

================================================

EOF

/opt/xtun/xTun -I $NET -k $XTUN_PSK -s -P 128 -n -V
