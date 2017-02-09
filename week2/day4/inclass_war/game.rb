require_relative 'deck'

class Game

  attr_accessor :player_1,
                :player_2,
                :p1_wins,
                :p2_wins,
                :rounds,
                :ties

  def initialize
    @player_1 = Deck.new
    @player_2 = Deck.new
    @p1_wins = []
    @p2_wins = []
    @rounds = 0
    @ties = 0
  end

  def play
    until player_1.dry?
      hand
    end
    game_over
  end

  def hand
    self.rounds += 1
    p1_card = player_1.draw
    p2_card = player_2.draw
    if p1_card > p2_card
      p1_wins << p1_card
      p1_wins << p2_card
    elsif p2_card > p1_card
      p2_wins << p1_card
      p2_wins << p2_card
    else
      self.ties += 1
    end
  end

  def game_over
    if p1_wins.length > p2_wins.length
      puts "Player One won after #{rounds} rounds and #{ties} WARS."
    elsif p2_wins.length > p1_wins.length
      puts "Player Two won after #{rounds} rounds and #{ties} WARS."
    else
      puts "We tied after #{rounds} rounds and #{ties} WARS"
    end
    ask_for_rematch
  end

  def ask_for_rematch
    puts "Would you like to play again? (y/n)"
    response = gets.chomp&.downcase
    if response == "y"
      Game.new.play
    else
      puts "Thanks for playing!"
      exit
    end
  end

end

Game.new.play
