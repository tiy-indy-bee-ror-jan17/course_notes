require 'minitest/autorun'
require_relative 'shop'

class ShopTest < MiniTest::Test

  def setup
    @shop = Shop.new(false)
  end

  def test_that_a_shop_has_a_human
    assert @shop.human.is_a? Human
    assert @shop.human.name == "Tester McTester"
  end

  def test_can_buy_things
    @shop.ask_for_drink_name(Coffee)
    assert @shop.human.cup.is_a? Coffee
    @shop.ask_for_drink_name(Tea)
    assert @shop.human.cup.is_a? Tea
  end


end
