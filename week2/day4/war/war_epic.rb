require_relative 'card'
require_relative 'deck'
require_relative 'player'

class War

  def self.winners
    @winners
  end

  def self.add_winner(win)
    @winners ||= []
    # if @winners
    #   @winners
    # else
    #   @winners = []
    # end
    @winners << win
  end

  def self.rounds
    @rounds
  end

  def self.add_rounds(rounds)
    @rounds = [] unless defined? @rounds
    @rounds << rounds
  end

  def self.wars
    @wars
  end

  def self.add_wars(wars)
    @wars = [] unless defined? @wars
    @wars << wars
  end

  attr_accessor :rounds, :wars, :pot, :player_one, :player_two

  def initialize
    self.player_one = Player.new("Player One")
    self.player_two = Player.new("Player Two")
    self.rounds = 0
    self.wars = 0
    self.pot = []
  end

  def play
    until game_over
      hand
    end
    output_results
  end

  def game_over
    player_one.dry? || player_two.dry?
  end

  def hand
    self.rounds += 1
    p1_card = player_one.draw
    p2_card = player_two.draw
    add_to_pot([p1_card, p2_card])
    if p1_card > p2_card
      player_one.win_cards(win_pot)
    elsif p2_card > p1_card
      player_two.win_cards(win_pot)
    else
      war
    end
  end

  def war
    self.wars += 1
    add_to_pot player_one.draw(4)
    add_to_pot player_two.draw(4)
  end

  def add_to_pot(cards)
    self.pot += cards
  end

  def win_pot
    cards = pot
    self.pot = []
    cards
  end

  def output_results
    self.class.add_winner(winner.name)
    self.class.add_rounds(rounds)
    self.class.add_wars(wars)
    puts "#{winner.name} won after #{rounds} rounds and survived #{wars} wars."
  end

  def winner
    player_one.dry? ? player_two : player_one
  end

end
