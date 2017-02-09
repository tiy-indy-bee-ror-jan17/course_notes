class Player

  attr_accessor :name, :deck, :winnings

  def initialize(name)
    self.name = name
    self.deck = Deck.new
    reset_winnings
  end

  def cycle
    deck.refill(winnings)
    reset_winnings
  end

  def reset_winnings
    self.winnings = []
  end

  def dry?
    deck.empty? && winnings.empty?
  end

  def draw(num=1)
    if deck.cards.length < num
      cycle
    end
    deck.deal(num)
  end

  def win_cards(cards)
    self.winnings += cards
  end

end
