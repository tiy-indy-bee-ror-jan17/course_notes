require 'minitest/autorun'
require_relative 'data_parser'

class DeliveryTest < MiniTest::Test

  def setup
    data = {
      destination: "Earth",
      what_got_shipped: "Food",
      number_of_crates: "32",
      money_we_made: "45000"
    }
    @delivery = Delivery.new(data)
  end

  def test_a_hash_can_be_turned_into_a_delivery
    assert @delivery.is_a? Delivery
  end

  def test_pilot_gets_set
    assert @delivery.pilot == "Fry"
  end

  def test_amy_gets_set
    @delivery.planet = "Mars"
    assert @delivery.pilot == "Amy"
  end

  def test_bender_gets_set
    @delivery.planet = "Uranus"
    assert @delivery.pilot == "Bender"
  end

  def test_leela_gets_set
    @delivery.planet = "srkghdrslgh"
    assert @delivery.pilot == "Leela"
  end

  def test_bonus_is_properly_set
    assert @delivery.bonus.is_a? Float
    assert @delivery.bonus == 4500
  end

end

class ParseTest < MiniTest::Test

  def setup
    Parse.new.parse_data('planet_express_logs.csv')
  end

  def test_converts_to_delivery_objects
    assert Parse.deliveries.length == 10
    assert Parse.deliveries.all?{|obj| obj.is_a? Delivery}
  end

  def test_weekly_revenue
    assert Parse.weekly_revenue == 536895
  end

  def test_different_bonuses
    report = Parse.pilot_report
    assert report == pilot_output
  end

  def pilot_output
    [
      "Fry is owed 3500.0 in bonuses on 2 deliveries",
      "Leela is owed 13129.5 in bonuses on 5 deliveries",
      "Amy is owed 1500.0 in bonuses on 1 deliveries",
      "Bender is owed 35560.0 in bonuses on 2 deliveries"
    ]
  end



end
