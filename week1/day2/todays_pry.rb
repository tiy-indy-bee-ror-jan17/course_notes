system('say Hello')
exit
system("say Howdy")
exit
"343" * 2
exit
[1,2,3,4,5,6]
arr = [1,2,3,4,5,6]
arr[0]
arr[1]
arr[2]
arr[3]
arr[4]
arr[5]
arr[6]
arr[-1]
arr.first
arr.last
arr.second
arr.first
arr[0]
arr.last
arr[-1]
arr[-2]
arr[-12]
arr.length
arr.size
arr.count
arr
arr.shuffle
arr
arr.shuffle!
arr.pop
arr
arr.shift
arr
arr.shift
arr
arr.push(4)
arr.push(6)
arr << 7
[1,2,3,4] << 8
arr = arr << arr.shift
arr
arr = arr << arr.shift
arr
arr.shift
arr
arr.unshift(5)
arr
for number in array
  puts number * 3
end
for number in arr
  puts number * 3
end
arr
arr.each do |num|
  puts num * 3
end
box = []
arr
arr.each do |num|
  box << num * 3
end
box
arr
arr.each do |num|
  num = num * 3
end
arr
arr.each_with_index do |num, index|
  arr[index] = num * 3
end
arr
x = 0
arr.each do |num|
  arr[x] = num * 3
  x += 1
end
arr
arr["stuff"]
arr
arr << "String"
arr << [4,5,6]
arr.length
arr.last
arr.last.length
arr[-2]
arr[-2].length
"string".first
"string"[0]
"string"[-1]
arr
arr + [1,2,3]
arr = arr + [1,2,3]
arr
arr[0
]
arr["stuff"]
hashie = {}
hashie
hashie["label"]
hashie["label"] = "Our label"
hashie
hashie["label"]
hashie.first
hashie["key2"] = "Hey"
hashie
hashie << "Hey"
arr
arr2 = [1,2,3]
arr3 = [3,2,1]
arr2 == arr3
hash1 = {"key1" => "value", "key2" => "val"}
hash2 = {"key2" => "val", "key1" => "value"}
hash1 == hash2
arr2 == arr3
hashie["label"]
arr[0]
hashie["hey"]
arr[23]
exit
hash = Hash.new("default")
hash["key"]
exit
hash1 = {"key1" => "value", "key2" => "val"}
hash1.keys
hash1.keys.to_s
hash1.keys
hash1.keys.join(", ")
exit
arr = []
arr << "String"
arr << 3
arr << {key2: "value"}
:symbol
"string".reverse
:symbol.reverse
:symbol.to_s.reverse
students = []
students << {name: "Rob", hometown: "Indy"}
students << {name: "David", hometown: "Bloomington"}
students << {name: "Nancy", hometown: "Kokomo"}
students << {name: "Kalea", hometown: "Spokane"}
students << {name: "Laura", hometown: "KC"}
students << {name: "Dave", hometown: "Avon"}
students << {name: "Demetra", hometown: "SF"}
students << {name: "Kendrick", hometown: "Hobart"}
students << {name: "Phil", hometown: "Lynchburg"}
students << {name: "Ben", hometown: "North Salem"}
students << {name: "Michael", hometown: "Warsaw"}
students << {name: "Miguel", hometown: "Lake Station"}
students.length
students << {name: "Chris", hometown: "Spencer"}
students.each do |student|
end
students.each do |student|
  puts student.class
end
students.each do |student|
  puts student.:name
end
students.each do |student|
  puts student.name
end
students.each do |student|
  puts student.key
end
students.each do |student|
  puts student.key[1]
end
students.each do |student|
  puts student.key(:name)
end
arr
arr[0]
hash = {key1: "thing"}
hash[:key1]
students.each do |student|
  puts student[:name]
end
students.each do |student|
  puts student["name"]
end
"name" == :name
hash = {key1: "thing"}
hash[:key2]
puts nil
students
miguels = []
students.each do |hash|
  miguels << hash if hash[:name] == "Miguel"
end
miguels
miguels.first[:hometown]
students.detect{|hash| hash[:name] == "Miguel"][:hometown]
students.detect{|hash| hash[:name] == "Miguel"]}[:hometown]
students.detect{|hash| hash[:name] == "Miguel"}[:hometown]
students.detect{|hash| hash[:name] == "Miguel"}
students.detect{|hash| hash[:name] == "Miguel"}.class
students.detect{|hash| hash[:name] == "Miguel"}[:hometown]
exit
:Hometown == :hometown
"String" == "string"
class Person
end
class :hometown
exit
arr = [1,2,3,4,5]
arr.include? 2
arr.include? 4
arr.include?(4)
arr[4]
arr.include?([4])
arr
arr.include?(4)
students = [
  {:name=>"Rob", :hometown=>"Indy", siblings: [nil]},
  {:name=>"David", :hometown=>"Bloomington", siblings: ["Christine"]},
  {:name=>"Nancy", :hometown=>"Kokomo", siblings: ["Kathy", "Judy"]},
  {:name=>"Kalea", :hometown=>"Spokane", siblings: [nil]},
  {:name=>"Laura", :hometown=>"KC", siblings: ["Sean", "Adam"]},
  {:name=>"Dave", :hometown=>"Avon", siblings: ["Jess", "Rache"]},
  {:name=>"Demetra", :hometown=>"SF", siblings: ["Desiree"]},
  {:name=>"Kendrick", :hometown=>"Hobart", siblings: ["Erica", "Alex"]},
  {:name=>"Phil", :hometown=>"Lynchburg", siblings: ["Andrew", "Lindsey", "Matthew", "Ellie"]},
  {:name=>"Ben", :hometown=>"North Salem", siblings: ["Nick"]},
  {:name=>"Michael", :hometown=>"Warsaw", siblings: ["Stephen"]},
  {:name=>"Miguel", :hometown=>"Lake Station", siblings: ["Miana", "Yolanda", "Christina"]},
  {:name=>"Chris", :hometown=>"Spencer", siblings: ["Sarah"]}
]
students.each do |student|
  puts student[:siblings]
end
siblings = students.last[:siblings]
siblings.include? "Sarah"
siblings.include? "Sara"
siblings = students.last[:siblings].include? "Sarah"
exit
"our funky sentence of dooooom".split
"our funky sentence of dooooom".split(//)
"our funky sentence of dooooom".chars
exit
{:symbol => "value"}
{symbol: "value"}
nil&.downcase
nil.downcase
nil&.downcase
"STRING"&.downcase
2 == 3
2 == "2"
2 == 2.0
2 === 2.0
2 === "2"
2 === "2".to_i
exit
array = [1,2,3,4,5]
array[2]
array.first
array.last
array << 6
container = []
array.each do |num|
  container << num * 3
end
container
container = []
array.each do |num|
  container << num * 3 if num.even?
end
container
container = []
array.each do |num|
  container << num (* 3 if num.even?)
array.each do |num|
  if num.even?
    container << num * 3
  else
    container << num
  end
end
container
student = {:name=>"David", :hometown=>"Bloomington", siblings: ["Christine"]}
student.each do |thing|
  puts thing.inspect
end
student.each do |key, value|
  puts "#{value} is this student's #{key}"
end
["christine"].join
["christine"].join(",")
"David".join(", ")
[1,2,3].split
:symbol.to_s
var = nil
var + " is awesome"
"#{var} is awesome"
var = ""
var + " is awesome"
var.to_s + " is awesome"
var = nil
var.to_s + " is awesome"
"#{var} is awesome"
exit
