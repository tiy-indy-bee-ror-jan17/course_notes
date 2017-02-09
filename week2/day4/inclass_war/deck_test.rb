require 'minitest/autorun'
require_relative 'deck'

class DeckTest < MiniTest::Test

  def test_a_deck_has_52_cards
    deck = Deck.new
    assert_equal 52, deck.cards.length
    assert deck.cards.all?{|c| c.is_a? Card}
  end

  def test_gets_shuffled_when_created
    deck1 = Deck.new
    deck2 = Deck.new
    refute_equal deck1.cards, deck2.cards
  end

  def test_a_deck_can_be_drawn
    deck = Deck.new
    draw = deck.draw
    assert draw.is_a? Card
    assert_equal 51, deck.cards.length
  end

  def test_if_deck_is_dry
    deck = Deck.new
    52.times { deck.draw }
    assert deck.dry?
  end

end
