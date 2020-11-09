#!/bin/bash

rm -f .env
while read line; do
    var=`echo $line | cut -d'=' -f1`
    read -u 3 -p "$var: " value
    echo "$var=$value" >> .env
done 3<&0 <.env.sample
