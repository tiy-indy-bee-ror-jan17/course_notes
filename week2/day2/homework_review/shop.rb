require_relative 'human'
require_relative 'coffee'
require_relative 'espresso'
require_relative 'tea'

class Shop

  attr_accessor :human, :valid_option

  def initialize(name)
    @human = Human.new(name)
    @valid_option = false
    pick_an_option
  end

  def ask_for_drink_name(klass)
    puts "What kind of #{klass.to_s.downcase} would you like?"
    choice = $stdin.gets.chomp
    human.buy(klass.new(choice))
  end

  def pick_an_option
    until valid_option
      puts "What would like."

      response = $stdin.gets.chomp.downcase

      case response
      when "coffee"
        self.valid_option = true
        ask_for_drink_name(Coffee)
      when "tea"
        self.valid_option = true
        ask_for_drink_name(Tea)
      when "espresso", "expresso"
        self.valid_option = true
        ask_for_drink_name(Espresso)
      else
        puts "Please pick a valid option"
      end
    end
    drink_until_empty
  end

  def drink_until_empty
    until human.cup.empty?
      puts human.cup.inspect
      puts "Looks like you have something to drink."
      puts "Would you like to drink? (y/n)"

      want = $stdin.gets.chomp[0].downcase

      if want == "y"
        if human.drink! == "STAHP. SEEK MEDICAL ATTENTION"
          puts "Hi. Looks like you've had too much to drink."
          puts "goodbye."
          exit
        else
          puts "Ahhhhhh."
        end
      end

    end
    ask_for_another
  end

  def ask_for_another
    puts "Looks like you drank it all."

    puts "Would you like to buy another?"

    desire = $stdin.gets.chomp[0].downcase

    if desire == "y"
      self.valid_option = false
      pick_an_option
    end
  end

end
puts "Hi. Welcome to our coffee shop."

puts "We have Coffee, Tea and Espresso available."

puts "First off, what's you name?"

name = $stdin.gets.chomp

Shop.new(name)
