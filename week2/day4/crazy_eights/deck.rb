require_relative 'card'

class Deck

  attr_accessor :cards

  def initialize
    @cards = []
    Card.suits.each do |s|
      Card.faces.each do |f|
        cards << Card.new(f, s)
      end
    end
    shuffle!
  end

  def draw
    cards.shift
  end

  def dry?
    cards.empty?
  end

  def shuffle!
    cards.shuffle!
  end


end
