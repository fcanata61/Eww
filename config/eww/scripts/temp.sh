#!/bin/bash
# Usa 'sensors' para pegar temperatura da CPU
sensors | grep 'Package id 0:' | awk '{print $4}' | tr -d '+°C' || echo 0
