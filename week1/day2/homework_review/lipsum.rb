#!/usr/bin/env ruby

require 'shellwords'

lipsum_wanted = ARGV.first
number_of_paragraphs = ARGV[1].to_i
# if number_of_paragraphs < 1 || number_of_paragraphs > 50
unless (1..50).include? number_of_paragraphs
  number_of_paragraphs = 1
end

copy = true

output =  if lipsum_wanted == "standard"
            "Standard's lipsum\n" * number_of_paragraphs
          elsif lipsum_wanted == "hipster"
            "Hipster ipsum\n" * number_of_paragraphs
          elsif lipsum_wanted == "samuel"
            "bleep bleeping bleep, mother bleeper\n" * number_of_paragraphs
          else
            copy = false
            "Please choose 'standard', 'samuel', or 'hipster'"
          end

puts output

command = "echo #{output.shellescape} | pbcopy"

# command = "echo '#{output}' | pbcopy"

puts command


system(command) if copy
