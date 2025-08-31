#!/bin/bash
# Mostra tráfego de rede (simples, usa /proc/net/dev)
RX1=$(cat /sys/class/net/*/statistics/rx_bytes | awk '{s+=$1} END {print s}')
TX1=$(cat /sys/class/net/*/statistics/tx_bytes | awk '{s+=$1} END {print s}')
sleep 1
RX2=$(cat /sys/class/net/*/statistics/rx_bytes | awk '{s+=$1} END {print s}')
TX2=$(cat /sys/class/net/*/statistics/tx_bytes | awk '{s+=$1} END {print s}')

RX_DIFF=$(( (RX2 - RX1) / 1024 ))
TX_DIFF=$(( (TX2 - TX1) / 1024 ))

# converte para % fictício só para progress ring (ex: até 10MB/s = 100%)
VAL=$(( (RX_DIFF + TX_DIFF) / 100 ))
[ $VAL -gt 100 ] && VAL=100
echo $VAL
