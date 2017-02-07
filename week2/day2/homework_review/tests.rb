require 'minitest/autorun'

require './human'
require './coffee'
require './espresso'
require './tea'



class CaffeineTest < MiniTest::Test
  def test_humans_tend_to_be_sleepy
    tyler = Human.new "Tyler"
    assert tyler.alertness < 0.1
  end

  def test_humans_need_coffee
    randy = Human.new "Randy"
    refute randy.has_coffee?
    assert randy.needs_coffee?
  end

  def test_humans_can_drink_coffee
    sherri = Human.new "Sherri"
    tsmf = Coffee.new "Triple Shot Mocha Frappuccino"
    assert tsmf.full?

    sherri.buy tsmf
    sherri.drink!
    assert(sherri.alertness.between?(0.1, 0.33))
    refute tsmf.full?
    refute tsmf.empty?
  end

  def test_humans_can_drink_all_the_coffee
    3.times { trevor.drink! }
    assert trevor.cup.empty?
    assert trevor.alertness > 0.9
  end

  def test_cant_drink_from_an_empty_cup
    3.times { trevor.drink! }
    assert trevor.drink! == "You need to buy moar coffee"
  end

  def test_you_need_coffee_if_you_have_no_coffee
    assert trevor.has_coffee?
  end

  def test_alertness_affects_need_for_coffee

    2.times { trevor.drink! }
    refute trevor.needs_coffee?
    assert trevor.has_coffee?
  end

  def test_cant_be_too_much_coffee_man

    3.times { trevor.drink! }
    latte = Coffee.new "Grande Vanilla Latte"
    trevor.buy latte
    trevor.drink!
    current_alertness = trevor.alertness
    assert trevor.drink! == "STAHP. SEEK MEDICAL ATTENTION", trevor.drink!
    assert current_alertness == trevor.alertness
  end

  def test_espresso_has_only_one_drink_and_greater_dose
    shot = Espresso.new
    assert shot.dose == 0.4
    assert_equal 1, shot.drinks
  end

  def test_tea_has_a_lower_dose
    glass = Tea.new
    assert glass.dose == 0.25
    assert_equal 3, glass.drinks
  end

  def trevor
    unless defined?(@trevor)
      @trevor = Human.new "Trevor"
      tsmf = Coffee.new "Triple Shot Mocha Frappuccino"
      @trevor.buy tsmf
    end
    @trevor
  end

end

# variable
# @instance
# CONSTANT
#
# $global
# @@class
