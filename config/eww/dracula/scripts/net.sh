#!/bin/bash
RX1=$(cat /sys/class/net/*/statistics/rx_bytes | awk '{s+=$1} END {print s}')
sleep 1
RX2=$(cat /sys/class/net/*/statistics/rx_bytes | awk '{s+=$1} END {print s}')
DOWN=$(( (RX2 - RX1) / 1024 ))
VAL=$(( DOWN > 100 ? 100 : DOWN ))
echo $VAL
