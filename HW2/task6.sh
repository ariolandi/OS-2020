#!/bin/bash

mkdir bin2
find /usr/bin -mindepth 1 -perm 777 -exec cp -P --preserve=mode '{}' bin2 \;

find ./bin2 -mindepth 1 -maxdepth 1 -regex "./bin2/b.*" -exec tar -c -f '{}'.tar '{}' \; -delete
