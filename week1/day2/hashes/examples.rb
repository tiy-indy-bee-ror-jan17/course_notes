sibling_wanted = ARGV[0].to_s

def sibling_finder(to_find="Sarah", array_of_students=[])
  puts to_find.inspect
  puts array_of_students.inspect
  array_of_students.detect do |student|
    student[:siblings].include? to_find
  end
end

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

students.each do |hash|
  hash[:state] = "WV"
end

# puts students.inspect

student = sibling_finder(sibling_wanted, students)

student2 = sibling_finder(students)

puts student2.inspect

if student
  puts "#{student[:name]} from #{student[:hometown]}"
else
  puts "Not enrolled"
end
