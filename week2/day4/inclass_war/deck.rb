require_relative 'card'

class Deck

  attr_accessor :cards

  def initialize
    @cards = []
    suits = %w(Clubs Diamonds Hearts Spades)
    faces = (2..10).to_a + %w(J Q K A)
    suits.each do |s|
      faces.each do |f|
        cards << Card.new(f, s)
      end
    end
    cards.shuffle!
  end

  def draw
    cards.shift
  end

  def dry?
    cards.empty?
  end


end
