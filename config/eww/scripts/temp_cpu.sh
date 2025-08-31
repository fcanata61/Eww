#!/bin/bash
sensors | awk '/^Package id 0:/ {print int($4)}'
