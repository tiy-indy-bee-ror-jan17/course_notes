require 'pry'
# Explorer Mode

# 1. **Define a Robot class:** A robot has a name

class Robot

  # 3. Robots should also have a height, with a default value of 10
  attr_accessor :name, :height

  # def name=(name)
  #   @name = name
  # end

  def initialize(new_name, height=10)
    @name = new_name
    @height = height
  end

  def name
    "Captain #{@name}"
  end

  # 2. A robot instance should have a method called 'say_hi' and it should return "Hi!"

  def say_hi
    # puts self.inspect
    "Hi"
  end

  # 3. A robot instance should have a method called 'say_name' and it should return "My name is X" where X is the robot's name

  def say_name
    # name = "Bender"
    "My name is #{name}"
  end

  def method_missing(meth, *args, &block)
    # puts "Does not compute!"
    super
  end

end

# binding.pry



# 4. **Define a BendingUnit class**
# 5. A BendingUnit inherits from Robot

class BendingUnit < Robot

  # attr_accessor :object_to_bend

# 6. A bending unit instance has a method called 'bend'
# 7. The bend method has one argument 'object_to_bend'
# 8. The bend method should put to the console "Bend X!" where X is object_to_bend
  #
  # def bend(object_to_bend)
  #   "Bend #{object_to_bend}!"
  # end

  def do_stuff_to_other_stuff(stuff, other_stuff)
    puts stuff.class
    "#{stuff} #{other_stuff}!"
  end

  def method_missing(meth, *args, &block)
    if args.length == 1
      do_stuff_to_other_stuff(meth, args.first)
    else
      super
    end
  end

end

# bender.think("ethically")

# 9. **Define an ActorUnit class**
# 10. An ActorUnit inherits from Robot
class ActorUnit < Robot

# 11. An ActorUnit instance has a method called 'change_name'
# 12. The 'change_name' method accepts an argument 'new_name'
# 13. The 'change_name' method changes the name property of the robot to 'new_name'

  def change_name(new_name)
    self.name = new_name
  end

end

binding.pry

# Adventure Mode

our_class = %w(Kalea Nancy Dave Rob Laura David Phil Ben Kendrick Miguel Michael Demetra)

# 1. Take our student array from yesterday and (programmatically) create robots out of all of them and store them in an array.
# 2. Do the previous using an Enumerable method other than `each`
# 1. Randomly assign the class of the robot on creation.

classes = [Robot, BendingUnit, ActorUnit]

cybermen = our_class.collect{|name| classes.sample.new(name, rand(5..50))}

cybermen.each do |cyber|
  puts "#{cyber.say_hi}, I'm #{cyber.name}, I'm a #{cyber.class} and I am #{cyber.height} feet tall"
end
