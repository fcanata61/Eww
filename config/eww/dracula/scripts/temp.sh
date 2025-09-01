#!/bin/bash
sensors | awk '/^Package id 0:/ {gsub("+",""); print int($4)}' || echo 0
