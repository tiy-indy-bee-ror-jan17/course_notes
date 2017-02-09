require 'minitest/autorun'
require_relative 'card'

class CardTest < MiniTest::Test

  def test_a_card_has_a_face_and_suit
    card = Card.new(8, "Diamonds")
    assert_equal "8", card.face
    assert_equal "Diamonds", card.suit
  end

  def test_a_card_should_determine_value
    card = Card.new("J", "Clubs")
    assert_equal 11, card.value
  end

  def test_cards_can_be_compared
    card1 = Card.new("Q", "Clubs")
    card2 = Card.new("J", "Diamonds")
    assert card1 > card2
    assert card2 < card1
  end

  def test_cards_are_equal
    card1 = Card.new("Q", "Hearts")
    card2 = Card.new("Q", "Spades")
    assert_equal card1, card2
  end

  def test_card_to_s
    card = Card.new("Q", "Diamonds")
    assert_equal "a Q of Diamonds", card.to_s
  end

end
