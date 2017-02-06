require 'csv'

# ## Explorer Mode
#
# **Good news Rubyists!**
# We have a week of records tracking what we shipped at Planet Express.  I need you to answer a few questions for Hermes.
#
# 1. How much money did we make this week?
# 2. How much of a bonus did each employee get? (bonuses are paid to employees who pilot the Planet Express)
# 3. How many trips did each employee pilot?
# 4. Define and use your Delivery class to represent each shipment
#
# Different employees have favorite destinations they always pilot to
#
# * Fry - pilots to Earth (because he isn't allowed into space)
# * Amy - pilots to Mars (so she can visit her family)
# * Bender - pilots to Uranus (teeheee...)
# * Leela - pilots everywhere else because she is the only responsible one
#
# They get a bonus of 10% of the money for the shipment as the bonus
#

class Delivery

  attr_accessor :planet,
                :shipment,
                :crates,
                :revenue,
                :bonus

  def initialize(destination:, what_got_shipped:, number_of_crates:, money_we_made:)
    @planet = destination
    self.shipment = what_got_shipped
    @crates = number_of_crates.to_i
    @revenue = money_we_made.to_i
    @bonus = revenue * 0.1
  end

  def pilot
    pilot_map[planet]
  end

  def pilot_map
    pilots = Hash.new("Leela")
    pilots["Earth"] = "Fry"
    pilots["Mars"] = "Amy"
    pilots["Uranus"] = "Bender"
    pilots
  end

end

class Parse

  def self.deliveries
    @deliveries
  end

  def self.deliveries=(dev)
    @deliveries = dev
  end

  def parse_data(filename)
    self.class.deliveries = CSV.foreach(
                              filename,
                              headers: true,
                              header_converters: :symbol
                            ).collect do |row|
                              Delivery.new(row)
                            end
  end

  def self.weekly_revenue
    total_up(deliveries, :revenue)
  end

  def self.pilot_report
    deliveries.group_by(&:pilot).collect do |pilot, deliveries|
      "#{pilot} is owed #{total_up(deliveries, :bonus)} in bonuses on #{deliveries.count} deliveries"
    end
  end

  def self.planet_report
    deliveries.group_by(&:planet).collect do |planet, deliveries|
      "#{planet} netted #{total_up(deliveries, :revenue)} on #{deliveries.count} deliveries"
    end
  end

  def self.total_up(deliveries, method)
    deliveries.inject(0){|sum, delivery| sum + delivery.send(method)}
  end

end

# ## Adventure Mode
#
# * Define a class "Parse", with a method `parse_data`, with an argument `file_name`
#   that handles output to the console
# * How much money did we make broken down by planet? ie. how much did we make shipping to Earth? Mars? Saturn? etc.
#



#
# ## Epic Mode
#
# * No `puts` or `print`'s in any method
# * No methods longer than 10 lines long
# * Make `data_parser.rb` executable with a command line argument of the file name
#
# > `./data_parser.rb planet_express_logs.csv`
#
# ## Legendary Mode
#
# * All the above questions should have corresponding class methods in Parse
# * If the script is called with a `report` argument (as in: `./data_parser.rb planet_express_logs.csv report`), the script saves a new CSV file in the current directory with payroll information in the format of: `Pilot, Shipments, Total Revenue, Payment`
