#!/bin/bash
# Mostra o workspace ativo com ícones diferentes
current=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
for i in {0..4}; do
  if [ "$i" -eq "$current" ]; then
    echo ""   # Ativo
  else
    echo ""   # Inativo
  fi
done
