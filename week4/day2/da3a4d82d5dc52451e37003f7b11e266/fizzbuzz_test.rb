require "minitest/autorun"
require_relative "fizz_buzz"

class FizzbuzzTest < MiniTest::Test

  def test_fizzbuzz_output
    results = FizzBuzz.run
    assert_equal Array, results.class
    assert_equal 100, results.length
    assert_equal "Buzz", results[54]
    assert_equal "FizzBuzz", results[14]
    assert_equal "Fizz", results[2]
    assert_equal 7, results[6]
  end

end