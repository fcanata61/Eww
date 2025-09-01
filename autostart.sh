#!/bin/bash

# Caminho base do Eww
EWW="$HOME/.config/eww"

# Garante que o daemon não esteja duplicado
pkill -f "eww daemon"

# Inicia o daemon
$EWW/../bin/eww daemon &

# Espera o daemon subir
sleep 1

# Abre a dock
eww open dock

# Se quiser abrir o painel sempre junto, descomente:
# eww open panel

# Mantém scripts de monitoramento atualizando as variáveis
while true; do
  eww update cpu_usage=$($EWW/scripts/cpu.sh)
  eww update mem_usage=$($EWW/scripts/mem.sh)
  eww update net_usage=$($EWW/scripts/net.sh)
  eww update temp_value=$($EWW/scripts/temp.sh)
  eww update workspaces="[$($EWW/scripts/workspaces.sh | tr '\n' ' ')]"
  sleep 3
done &
