# variable = "Reggie Rembert"
puts ARGV.inspect
display = ARGV[0]
# if ARGV[1]
#   num = ARGV[1].to_i
# else
#   num = 1
# end
# num = ARGV[1] || 1
# num = num.to_i
num = ARGV[1] ? ARGV[1].to_i : 1
# num = 1 unless num > 0
# num = num.to_i if num.to_i.to_s == num
puts "Display is: #{display}"
variable = display.downcase
puts "Variable is: #{variable}"
puts "Num is: #{num}"

SCHOOL = 'WVU'.freeze
# SCHOOL = "Florida State"

position = case variable
           when 'major harris'
             'QB'
           when 'cornlieus bennet'
             'DE'
           when 'reggie rembert'
             'WR'
end

puts "Position is: #{position.inspect}"

if position.nil?
  puts 'Waves!'
  position = if variable == 'james jett'
               'WR'
             elsif variable == 'cornlieus bennet'
               'DE'
             elsif variable == 'major harris'
               'QB'
             else
               'WTF?'
             end
end

puts num.class

(num < 1 ? 1 : num).times do
  puts "#{display} played #{position} at " + SCHOOL
end

puts "Num is still: #{num}"

puts 'Hello World!'
