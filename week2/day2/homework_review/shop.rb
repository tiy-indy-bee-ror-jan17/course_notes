require_relative 'human'
require_relative 'coffee'
require_relative 'espresso'
require_relative 'tea'
require 'tty'

class Shop

  attr_accessor :human, :valid_option, :output, :prompt

  def initialize(output = true)
    @output = output
    @prompt = TTY::Prompt.new
    @human = Human.new(greeting)
    @valid_option = false
    pick_an_option if output
  end

  def greeting
    if output
      puts "Hi. Welcome to our coffee shop."

      puts "We have Coffee, Tea and Espresso available."

      prompt.ask("First off, what's you name?")
    else
      "Tester McTester"
    end
  end

  def ask_for_drink_name(klass)
    if output
      choice = prompt.ask("What kind of #{klass.to_s.downcase} would you like?")
    else
      choice = "Tester"
    end
    human.buy(klass.new(choice))
  end

  def pick_an_option(response = nil)
    until valid_option
      response = prompt.select("What would like.", %w(Coffee Espresso Tea)).downcase if output

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
        string = "Please pick a valid option"
        if output
          puts string
        else
          string
        end
      end
    end
    drink_until_empty if output
  end

  def drink_until_empty(want = nil)
    until human.cup.empty?
      if output
        puts human.cup.inspect
        puts "Looks like you have something to drink."
        puts "Would you like to drink? (y/n)"

        want = $stdin.gets.chomp[0].downcase
      end

      if want == "y"
        if human.drink! == "STAHP. SEEK MEDICAL ATTENTION"
          if output
            puts "Hi. Looks like you've had too much to drink."
            puts "goodbye."
            exit
          else
            "Over"
          end
        else
          puts "Ahhhhhh." if output
        end
      end

    end
    ask_for_another if output
  end

  def ask_for_another(desire = nil)
    if output
      puts "Looks like you drank it all."

      puts "Would you like to buy another?"

      desire = $stdin.gets.chomp[0].downcase
    end

    if desire == "y"
      self.valid_option = false
      pick_an_option if output
    end
  end

end
