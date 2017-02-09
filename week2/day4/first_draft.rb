require_relative 'card'
require_relative 'deck'
require_relative 'player'

class Game

  attr_accessor :players, :rounds, :wars

  def initialize
    @players = []
    2.times do |num|
      @players << Player.new("Player #{num+1}")
    end
    @rounds = 0
    @wars = 0
  end

  def self.test_mode
    unless defined?(@@winners)
      @@winners = []
    end
    @@winners
  end

  def play
    until game_over?
      until players.first.deck.empty? || players.last.deck.empty?
        self.rounds += 1
        card_one = players.first.play_card
        card_two = players.last.play_card
        if card_one > card_two
          players.first.winnings << card_one
          players.first.winnings << card_two
        elsif card_two > card_one
          players.last.winnings << card_one
          players.last.winnings << card_two
        else # card_one == card_two
          self.wars += 1
          bag_of_holding = [card_one, card_two] + 5.times.collect{|_num| [players.first.play_card, players.last.play_card]}.flatten
          war_card_one = nil
          war_card_two = nil
          while (war_card_one == war_card_two) && !(players.first.deck.empty? || players.last.deck.empty?)
            war_card_one = players.first.play_card
            war_card_two = players.last.play_card
            bag_of_holding = bag_of_holding + [war_card_one, war_card_two]
          end
          if war_card_one.nil? && !war_card_two.nil?
            players.last.winnings = players.last.winnings + bag_of_holding.compact
          elsif war_card_two.nil? && !war_card_one.nil?
            players.first.winnings = players.first.winnings + bag_of_holding.compact
          elsif war_card_two.nil? && war_card_one.nil?
            players.first.winnings = players.first.winnings + bag_of_holding.compact.each_slice( (bag_of_holding.compact.size/2.0).round ).to_a[0]
            players.last.winnings = players.last.winnings + bag_of_holding.compact.each_slice( (bag_of_holding.compact.size/2.0).round ).to_a[1]
          elsif war_card_one > war_card_two
            players.first.winnings = players.first.winnings + bag_of_holding.compact
          else # war_card_two > war_card_one
            players.last.winnings = players.last.winnings + bag_of_holding.compact
          end
        end
      end
      if game_over?
        players.first.deck.cards = players.first.deck.cards + players.first.winnings
        players.last.deck.cards = players.last.deck.cards + players.last.winnings
        if ARGV[0] == "test"
          self.class.test_mode << winner.name
        else
          output_results
        end
      else
        players.first.deck.cards = players.first.deck.cards + players.first.winnings
        players.last.deck.cards = players.last.deck.cards + players.last.winnings
        players.first.deck.shuffle!
        players.last.deck.shuffle!
        players.first.winnings = []
        players.last.winnings = []
      end
    end
  end

  def output_results
    puts "#{winner.name} won this game after #{rounds} rounds and surviving #{wars} wars."
  end

  def winner
    players.max do |player1, player2|
      player1.winnings.length <=> player2.winnings.length
    end
  end

  def score
    [players.first.winnings.length, players.last.winnings.length].sort.reverse.join(" - ")
  end

  def game_over?
    (players.first.deck.empty? && players.first.winnings.empty?) ||
    (players.last.deck.empty? && players.last.winnings.empty?)
  end

end

if ARGV[0] == "test"
  1000.times do
    Game.new.play
  end
  winners = Game.test_mode.group_by{|winner| winner}.to_a
  puts "#{winners[0][0]} won #{winners[0][1].length} times. #{winners[1][0]} won #{winners[1][1].length} times."
else
  Game.new.play
end
