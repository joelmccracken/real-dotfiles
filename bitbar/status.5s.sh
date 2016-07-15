#!/bin/bash

number=`cat ~/.redd-up/cache | wc -l`

echo "Untidy: $number| color=red"

echo ---
echo "Open dired cleanup | bash=/Users/joel/bin/emacs-process-inbox terminal=false"

cat ~/.redd-up/cache
