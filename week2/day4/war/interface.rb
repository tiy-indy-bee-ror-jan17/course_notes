require_relative 'war_epic'
require_relative 'war_adventure'

if ARGV[0] == "epic"
  100000.times { War.new.play }

  puts "Player One won #{War.winners.count("Player One")} times and Player Two won #{War.winners.count("Player Two")} times."
  puts "Our longest game went #{War.rounds.max} rounds. Our most-violent round went through #{War.wars.max} wars."
  puts "On average, a game lasted #{War.rounds.inject(:+)/War.rounds.length} rounds and went through #{War.wars.inject(:+)/War.wars.length} wars."
  puts "Have a happy day!"
elsif ARGV[0] == "adventure"
  1000.times { AdventureWar.new.play }

  puts "Player One won #{AdventureWar.winners.count("Player One")} times and Player Two won #{AdventureWar.winners.count("Player Two")} times."
  puts "Our longest game went #{AdventureWar.rounds.max} rounds. Our most-violent round went through #{AdventureWar.wars.max} wars."
  puts "On average, a game lasted #{AdventureWar.rounds.inject(:+)/AdventureWar.rounds.length} rounds and went through #{AdventureWar.wars.inject(:+)/AdventureWar.wars.length} wars."
  puts "Have a happy day!"

end
