#!/bin/bash

number=`cat ~/.redd-up/cache | wc -l`

echo "Issues: $number| color=red"

echo ---
echo "Open dired cleanup | bash=/Users/joel/bin/emacs-process-inbox terminal=false"
cat ~/.redd-up/last-run
echo
cat ~/.redd-up/cache
