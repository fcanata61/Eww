#!/bin/bash
sensors | awk '/^temp1:/ {print int($2)}'
