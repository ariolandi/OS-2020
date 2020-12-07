#!/bin/bash

find -printf "%n;%p\n" | sort -t ";" -k 1 -r | head -n 5 | cut -d ";" -f 2
#find -printf "%n hardlinks in %p\n" | sort -t " " -k 1 -r | head -n 5
