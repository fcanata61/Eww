#!/bin/bash
xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'
