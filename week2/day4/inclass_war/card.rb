class Card

  attr_accessor :suit, :face, :value

  def initialize(face, suit)
    @suit = suit
    @face = face.to_s
    @value = find_value
  end

  def find_value
    if face.to_i.to_s == face
      face.to_i
    else
      map = {
        "J" => 11,
        "Q" => 12,
        "K" => 13,
        "A" => 14
      }
      map[face]
    end
  end

  def >(a)
    value > a.value
  end

  def <(a)
    value < a.value
  end

  def ==(a)
    if a.is_a? Card
      value == a.value
    else
      super(a)
    end
  end


end
