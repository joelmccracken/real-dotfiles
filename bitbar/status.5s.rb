#!/usr/bin/env ruby

number=`cat ~/.redd-up/cache | wc -l`.strip

puts "Issues: #{number} | color=red"
puts "---"
puts "Open dired cleanup | bash=/Users/joel/bin/emacs-process-inbox terminal=true"
puts File.read(File.expand_path '~/.redd-up/last-run')
puts ""
puts File.read(File.expand_path '~/.redd-up/cache')
