#!/bin/bash
# lista workspaces e marca ativo
ACTIVE=$(wmctrl -d | awk '$2=="*" {print $1}')
TOTAL=$(wmctrl -d | wc -l)

OUT="["
for i in $(seq 0 $((TOTAL-1))); do
  if [ "$i" -eq "$ACTIVE" ]; then
    OUT="$OUT \"1\""
  else
    OUT="$OUT \"0\""
  fi
done
OUT="$OUT ]"
echo $OUT
