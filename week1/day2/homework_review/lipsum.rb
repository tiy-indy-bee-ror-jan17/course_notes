#!/usr/bin/env ruby

require 'shellwords'

lipsum_wanted = ARGV.first
number_of_paragraphs = ARGV[1].to_i
# if number_of_paragraphs < 1 || number_of_paragraphs > 50
unless (1..50).include? number_of_paragraphs
  number_of_paragraphs = 1
end

lipsums = {}
lipsums["standard"] = "Standard's lipsum\n"
lipsums["samuel"] = "bleep bleeping bleep, mother bleeper\n"
lipsums["hipster"] = "Hipster ipsum\n"
lipsums["starwars"] = "Dark side ipsum\n"
lipsums["empire"] = "Handless ipsum\n"



copy = true

output = if lipsums[lipsum_wanted]
            lipsums[lipsum_wanted] * number_of_paragraphs
          else
            copy = false
            "Please choose one of " + lipsums.keys.join(", ")
          end

puts output

command = "echo #{output.shellescape} | pbcopy"

# command = "echo '#{output}' | pbcopy"

puts command


system(command) if copy
