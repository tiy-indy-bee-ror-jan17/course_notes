require 'pry'

class Person

  # attr_writer :name, :hair_color, :weight, :height
  # attr_reader :name, :hair_color, :weight, :height
  attr_accessor :name, :hair_color, :weight, :height

  def initialize(name, hair_color="Blonde", weight=185, height=66)
    @name = name
    @hair_color = hair_color
    @weight = weight
    @height = height
    # puts "You set my name to #{name}"
  end

  # attr_writer
  # attr_accessor
  # def name=(new_name)
  #   @name = new_name
  # end

  # attr_reader
  # attr_accessor
  # def name
  #   @name
  # end

  def walk(miles)
    "#{name} would walk #{miles} miles"
  end

  def speak
    system("say I am #{height} inches, you pedantics, tall")
  end

  def +(other)
    if other.is_a?(Baby) || self.is_a?(Baby)
      raise StandardError, "Kids shouldn't be having kids"
    else
      Baby.new(name + " " + other.name)
    end
  end

end

class Baby < Person

  attr_accessor :age
  undef_method :speak

  def initialize(name, hair_color="Blonde", weight=10, height=12)
    @name = name
    @hair_color = hair_color
    @weight = weight
    @height = height
    @age = 0
    # puts "You set my name to #{name}"
  end

  def grow(inches)
    @height += inches
    @age += 0.2
  end

  def walk(steps)
    if age < 0.5
      "I would kinda roll #{steps} feet"
    elsif age < 0.8
      "I would crawl #{steps} yards"
    else
      "I would run around like a chicken with its head cut off."
    end
  end

  def 💩
    puts "Poooooooooooooooop"
  end

end

class Chili

  def throw
    "Mess everywhere"
  end

  def eat
    "Yummmmmmmm"
  end

  def smoosh
    system('say squoooooosh')
  end

end

binding.pry

chuck = Person.new("Chuck")
# puts chuck.age
puts chuck.name
puts chuck.walk(500)
puts chuck.inspect
# chuck.speak
#
# puts chuck.walk(1000)
#
# puts chuck.name=("Chucky")
#
# puts chuck.name
#
# puts chuck.inspect
#
# # chuck.speak("Hi, my name is Chuck")
#
charles = Person.new("Charles", "NA", 280, 76)
puts charles.walk(5000)
# charles.speak

puts charles.inspect

#
# puts charles.walk(20)
#
# puts charles.name = "Charles"
#
# puts charles.name
#
# puts charles.inspect
#
# # charles.speak("And Im Charles")
#
# chili = Chili.new
#
# # chili.smoosh
#
# puts chili.eat

kidlet = Baby.new("Benjamin")

puts kidlet.name
kidlet.speak
puts kidlet.walk(500)
kidlet.grow(2)
puts kidlet.walk(500)
kidlet.grow(2)
puts kidlet.walk(500)
kidlet.grow(2)
puts kidlet.walk(500)
kidlet.grow(2)
puts kidlet.walk(500)
kidlet.grow(2)
puts kidlet.walk(500)
puts "My height is now #{kidlet.height}"
