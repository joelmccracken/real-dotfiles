#!/bin/bash

number=`cat ~/.loose-ends/cache | wc -l`

echo "Untidy: $number| color=red"

echo ---

cat ~/.loose-ends/cache
