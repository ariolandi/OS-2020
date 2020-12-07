#!/bin/bash

cut /etc/passwd -d "/" -f 2
grep -v "aa" /etc/passwd
