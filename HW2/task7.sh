#!bin/bash

find ~ -mindepth 1 -printf "%T@:%p\n" | sort -t ":" -k 1 | head -n 10
find ~ -mindepth 1 -printf "%A@:%p\n" | sort -t ":" -k 1 | head -n 10
