#!/usr/bin/env ruby

require 'date'

number=`cat ~/.redd-up/cache | wc -l`.strip

puts "Issues: #{number} | color=red"
puts "---"

raw_string = File.read(File.expand_path '~/.ex_supervisor/last-backup-date')
dt = DateTime.parse raw_string
formatted_nice = dt.to_time.getlocal.strftime("%I:%M %p %a %d-%m-%Y")

puts "last backup finished at: #{formatted_nice}"
puts "Open dired cleanup | bash=/Users/joel/bin/emacs-process-inbox terminal=true"
puts File.read(File.expand_path '~/.redd-up/last-run')
puts ""
puts File.read(File.expand_path '~/.redd-up/cache')
