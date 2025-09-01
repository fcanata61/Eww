#!/bin/bash
cat /sys/class/net/*/statistics/rx_bytes | awk '{sum+=$1} END {print sum/1000000}'
