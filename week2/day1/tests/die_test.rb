require 'minitest/autorun'
require_relative 'die'

class DieTest < MiniTest::Test

  def test_the_truth
    assert true == true
  end

  def test_the_nil
    assert nil.nil?
  end

  def test_die_has_sides
    assert Die.new.number_of_sides == 6, Die.new.number_of_sides.inspect
  end

  def test_a_die_can_have_20_sides
    assert Die.new(20).number_of_sides == 20
  end

  def test_a_die_can_be_rolled
    assert Die.new.roll.between?(1,6)
  end

  def test_die_can_be_added
    die = Die.new
    die2 = Die.new
    number = die + die2
    assert number.is_a? Fixnum
  end

  def test_math_is_correct
    die = Die.new
    die2 = Die.new
    number = die + die2
    assert (die.face + die2.face) == number
  end

  def test_die_can_be_compared
    die = Die.new
    die2 = Die.new
    die.face = 6
    die2.face = 3
    assert die > die2, die.inspect
  end

  def test_do_something
    die = Die.new
    assert die.do_something == "#{die.face} is showing", die.do_something.inspect
  end

end

# DieTest
# snake_case
# CONSTANT
# findPilot
