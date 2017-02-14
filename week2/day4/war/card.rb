class Card

  attr_accessor :face, :suit, :value

  def initialize(face, suit)
    self.face = face
    self.suit = suit
    self.value = set_value
  end

  def self.faces
    %w(2 3 4 5 6 7 8 9 10 J Q K A)
  end

  def self.suits
    %w(Clubs Diamonds Hearts Spades)
  end

  def set_value
    self.class.faces.index(face) + 2
  end

  def >(card)
    value > card.value
  end

  def ==(card)
    face == card.face && suit == card.suit
  end


end
