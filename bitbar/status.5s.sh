#!/bin/bash

number=`cat ~/.redd-up/cache | wc -l`

echo "Untidy: $number| color=red"

echo ---

cat ~/.redd-up/cache
