robot = Robot.new
robot.name
robot.name = "Robbie"
robot.name
robot = Robot.new("Robbie")
def initialize
end
exit
robot = Robot.new
robot = Robot.new("Robbie")
robot.say_hi
exit
robot = Robot.new("Robert")
robot.name
exit
robot = Robot.new("Chuck")
robot.zsgdwaehg
exit
robot = Robot.new("esger")
robot.aesgerwgh
robot.srdhersh
exit
bender = BendingUnit.new("Bender")
bender.bend("pipe")
bender.smoke("stuff")
bender.sehyes5rhtjh("rehyre5t")
bender.sehyes5rhtjh("rehyre5t", "ergerhg"))
bender.sehyes5rhtjh("rehyre5t", "ergerhg")
exit
bend = BendingUnit.new("seg")
bend.bend("pipe")
bend.blow("minds")
bend.methods
exit
begin
  nil.hey
rescue NoMethodError
  puts "seger"
end
exit
film = movie_objects.first
film2 = movie_objects.last
film > film2
film.budget > film2.budget
film.class
film.budget.class
2.>(3)
2 > 3
exit
film = movie_objects.first
film2 = movie_objects.last
film > film2
film < film2
film == film2
film.>(film2)
film > film2
film > 2
exit
film = movie_objects.first
film2 = movie_objects.last
film > film2
film < film2
film < 2
2&.budget
nil&.budget
exit
film = movie_objects.first
film2 = movie_objects.last
film > film2
film > 2
film > 200
film.between?(2..200)
film.between?(2, 200)
film > "thing"
exit
film = movie_objects.first
film > "thing"
exit
film = movie_objects.first
film > 2
film2 = movie_objects.first
film2 = movie_objects.last
film > film2
exit
robot = Robot.new("Chuck")
robot.name = "Charles"
%w(John Paul George Ringo Pete).collect{|name| Robot.new(name).name = "Zach"}
exit
def hey
  puts yield
end
hey { "Howdy" }
hey
def hey(&block)
  puts block.class
end
hey { "Howdy" }
def hey(&block)
  puts block.call
end
hey { "Howdy" }
hey
def hey(&block)
  if block_given?
    puts block.call
  else
    puts "No blocky, no worky"
  end
end
hey { "Howdy" }
hey
exit
[1,2,3,4].collect { "Hey" }
10.times.collect { "Na" }
:puts.to_proc
proc = :puts.to_proc
proc { "hey" }
proc.call("Hey")
rev = :reverse.to_proc
rev.call("Hey")
rev.call("Hey", "Howdy")
thing = "count(num)".to_sym.to_proc
thing.call [1,2,3,4], 3
thing = :count.to_proc
thing.call [1,2,3,4], 3
[1,2,3,4,5].length
[1,2,3,4,5].length(rgher)
[1,2,3,4,5].length(3)
[1,2,3,4,5].count(3)
[1,2,3,4,5,6,3,3,3,3].count(3)
[1,2,3,4,5,6,3,3,3,3].count{|num| num.even?}
exit
require 'csv'
CSV.foreach("planet_express_logs.csv", headers: true) do |row|
end
CSV.foreach("students.csv", headers: true) do |row|
  puts row.inspect
end
CSV.foreach("students.csv", headers: true) do |row|
  puts row["Name"]
end
CSV.foreach("students.csv", headers: true) do |row|
  puts row[" Favorite movie"]
end
CSV.foreach("students.csv", headers: true, symbolize_headers: true) do |row|
  puts row.inspect
end
CSV.foreach("students.csv", headers: true, header_converters: :symbol) do |row|
  puts row.inspect
end
data = CSV.foreach("students.csv", headers: true, header_converters: :symbol)
data.length
data.count
data.class
data.select{|row| row[:name] == "Dave"}
data.collect(&:to_h)
data.count{|row| row[:name] == "Dave"}
data.count{|row| row[:age] > 23}
"23" / 3
"23" * 0.1
"23" * 2.5
"23" * 2.9
exit
[1,2,3,4].to_s
exit
var = "youoty"
def var.speak
  system("say #{self}")
end
var.speak
"Hey".speak
exit
