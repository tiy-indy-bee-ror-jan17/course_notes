require 'tty'

class Game

  attr_accessor :choice, :computer_choice, :prompt

  def initialize
    @computer_choice = shoot!
    @prompt = TTY::Prompt.new
  end

  def shoot!
    selections.sample
  end

  def selections
    %w(rock paper scissors spock lizard)
  end

  def play
    if prompt.yes?("Would you like to play a game?")
      self.choice = prompt.select("Shoot ...", selections)
      determine_winner
    else
      end_game
    end
  end

  def winning_map
    {
      "paper" => ["rock", "spock"],
      "rock" => ["scissors", "lizard"],
      "scissors" => ["paper", "lizard"],
      "lizard" => ["spock", "paper"],
      "spock" => ["rock", "scissors"]
    }
  end

  def tie?
    choice == computer_choice
  end

  def you_win?
    winning_map[choice].include? computer_choice
  end

  def determine_winner
    if you_win?
      puts "You win: #{choice} > #{computer_choice}"
    elsif tie?
      puts "You tied: #{choice} == #{computer_choice}"
    else
      puts "You lost: #{choice} < #{computer_choice}"
    end
    ask_for_rematch
  end

  def ask_for_rematch
    play
  end

  def end_game
    puts "Goodbye"
    exit
  end

end

Game.new.play
