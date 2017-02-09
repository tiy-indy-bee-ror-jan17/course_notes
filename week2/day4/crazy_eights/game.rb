require_relative 'deck'
require 'tty'

class Game

  attr_accessor :deck,
                :p1_hand,
                :cpu_hand,
                :top_card,
                :prompt

  def initialize
    @deck = Deck.new
    @prompt = TTY::Prompt.new
    @p1_hand = []
    @cpu_hand = []
    7.times do
      @p1_hand << deck.draw
      @cpu_hand << deck.draw
    end
    @top_card = deck.draw
  end

  def play
    until p1_hand.empty? || cpu_hand.empty?
      player_hand
      computer_hand
    end
    game_over
  end

  def player_hand
    puts "You have:"
    p1_hand.each do |card|
      puts card
    end
    puts "The card currently showing is #{top_card}"
    if playable_cards(p1_hand).any?
      self.top_card = prompt.select("What's your play?", playable_cards(p1_hand))
      self.p1_hand -= [top_card]
    else
      puts "You have no play. :(. Drawing a card for you."
      p1_hand << deck.draw
    end
  end

  def computer_hand
    if playable_cards(cpu_hand).any?
      puts "Your opponent is playing a card"
      self.top_card = playable_cards(cpu_hand).first
      self.cpu_hand -= [top_card]
    else
      puts "You opponent drew ..."
      cpu_hand << deck.draw
    end
  end

  def playable_cards(hand)
    playable = hand.select{|card| card.suit == top_card.suit}
    playable += hand.select{|card| card.face == top_card.face}
    playable += hand.select{|card| card.face == "8"}
    playable.uniq
  end

  def game_over
    if p1_hand.empty?
      puts "YOU WINNNN!"
    else
      puts "You lost. :("
    end
    ask_for_rematch
  end

  def ask_for_rematch
    desire = prompt.yes?("Would you like a rematch?")
    if desire
      Game.new.play
    else
      puts "Thanks for playing."
      exit
    end
  end

end

Game.new.play
