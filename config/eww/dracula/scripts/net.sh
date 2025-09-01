#!/bin/bash
# Mostra velocidade de download/upload em KB/s
# Ajuste sua interface de rede (ex: eth0, enp3s0, wlan0)

INTERFACE="wlan0"
RX1=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX1=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
sleep 1
RX2=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX2=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

RX_RATE=$(( (RX2 - RX1) / 1024 ))
TX_RATE=$(( (TX2 - TX1) / 1024 ))

echo "$((RX_RATE+TX_RATE))"
