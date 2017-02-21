# Print the numbers 1 to 100
# For multiples of 3, print "Fizz" instead of the number
# For multiples of 5, print "Buzz" instead of the number
# For multiples of 3 and 5, print "FizzBuzz" instead of the number

class FizzBuzz

  def self.run
    (1..100).collect do |num|
      output = ""
      output += "Fizz" if num % 3 == 0
      output += "Buzz" if num % 5 == 0
      output = num if output == ""
      output
    end
  end


end
