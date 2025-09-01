#!/bin/bash
# Retorna a temperatura da CPU em %
# Ajuste o hwmon correto se necessário
sensors | grep -m 1 'Tctl:' | awk '{gsub("+",""); gsub(".0°C",""); print int($2)}'
