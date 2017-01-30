card1 = ARGV[0]
card2 = ARGV[1]

# ten_pointers = ["King", "Queen", "Jack", "10"]

puts card1
puts card2

if card1 && card2
  if card1 == "Ace" && card2 == "Ace"
    puts "Split, dummy"
  elsif card1 == "8" && card2 == "8"
    puts "Split those, too"
  elsif (card1.to_i == 0 && card2.to_i == 0) || card1 == "10" && card2 == "10"
    puts "Split 'em"
  else
    puts "¯\\_(ツ)_/¯"
  end
else
  puts "I need two cards to evaluate."
end
