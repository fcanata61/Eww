#!/bin/bash
IFACE="eth0"   # ou wlan0 conforme seu caso
if [[ $1 == "down" ]]; then
    cat /sys/class/net/$IFACE/statistics/rx_bytes
elif [[ $1 == "up" ]]; then
    cat /sys/class/net/$IFACE/statistics/tx_bytes
fi
