class Card

  include Comparable

  def self.faces
    ("2".."10").to_a + %w(J Q K A)
  end

  def self.suits
    %w(Clubs Diamonds Hearts Spades)
  end

  attr_accessor :suit, :face, :value

  def initialize(face, suit)
    @suit = suit
    @face = face.to_s
    @value = find_value
  end

  def find_value
    self.class.faces.index(face) + 2
  end

  def <=>(other)
    if other.is_a? Card
      value <=> other.value
    else
      super(other)
    end
  end

  def to_s
    "a #{face} of #{suit}"
  end

end
