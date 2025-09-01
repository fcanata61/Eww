#!/usr/bin/env bash

EWW="$HOME/.config/eww"

# Garante que o daemon do eww esteja rodando
eww daemon

# Fecha instâncias antigas
eww close-all

# Abre dock e painel
eww open dock
eww open panel

# Atualiza widgets periodicamente
while true; do
    eww update cpu_usage=$("$EWW/scripts/cpu.sh")
    eww update mem_usage=$("$EWW/scripts/mem.sh")
    eww update temp_value=$("$EWW/scripts/temp.sh")
    eww update net_usage=$("$EWW/scripts/net.sh")

    # Spotify
    eww update spotify_status=$("$EWW/scripts/spotify.sh" --status)
    eww update spotify_artist=$("$EWW/scripts/spotify.sh" --artist)
    eww update spotify_track=$("$EWW/scripts/spotify.sh" --track)
    eww update spotify_cover=$("$EWW/scripts/spotify.sh" --cover)

    # Workspaces genéricos
    eww update workspaces="$($EWW/scripts/ws.sh | tr '\n' ' ')"

    sleep 2
done
