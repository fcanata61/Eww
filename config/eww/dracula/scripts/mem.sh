#!/bin/bash
# Retorna uso da Memória em %
free | awk '/Mem:/ {print int($3/$2 * 100.0)}'
