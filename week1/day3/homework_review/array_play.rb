# 1. Create an array of all of the students in our class. Assign it to a variable named "our_class".
# our_class = ["Kalea", "Nancy", "Dave", "Rob", "Laura", "David", "Phil", "Ben", "Kendrick", "Miguel", "Michael", "Demetra"]
our_class = %w(Kalea Nancy Dave Rob Laura David Phil Ben Kendrick Miguel Michael Demetra)
# 2. Find all the students whose first name is less than 5 characters
short_names = []
our_class.each do |name|
  short_names << name if name.length < 5
end
puts short_names.join(" and ")
short_names2 = our_class.select{|name| name.length < 5}
puts short_names2.join(" and ")
# 3. Turn a sentence into an Array, and select the words that are four characters long. Here's your sentence: `sentence = "Ruby is actually kind of fun once you get used to it."`
sentence = "Ruby is actually kind of fun once you get used to it."

short_words = sentence.split.select{|word| word.length == 4}

puts "The short words are ..."

short_words.each do |word|
  puts word
end

# 4. Create an array of movies with budgets of less than 100 and another array of movies that starred Leonard DiCaprio.
movies = []
movies << {
  title: "Forest Gump",
  budget: 55,
  stars: ["Tom Hanks"]
}
movies << {
  title: "Star Wars",
  budget: 11,
  stars: ["Mark Hamill", "Harrison Ford"]
}
movies << {
  title: "Batman Begins",
  budget: 150,
  stars: ["Christian Bale", "Liam Neeson", "Michael Caine"]
}
movies << {
  title: "Titanic",
  budget: 200,
  stars: ["Kate Winslet", "Leonardo DiCaprio"]
}
movies << {
  title: "Inception",
  budget: 160,
  stars: ["Leonardo DiCaprio", "JGL"]
}

cheapies = movies
          .collect do |film|
            film[:title] if film[:budget] < 100
          end

puts cheapies.compact

leos = movies
          .select do |film|
            film[:stars].include? "Leonardo DiCaprio"
          end
leos = leos.collect{|film| film[:title]}

puts leos

# 5. Output the answers to all of the above to the command line.

# 7. Make a method that will return the words in a String that are `x` characters long (as in: `how_many_words(text, num)`)

def how_many_words(text, num)
  text.split.select{|word| word.length == num}
end

# 6. Make a method that will always return the words in a String that contain four characters. Called as: `four_words(text)` Use this to answer the relevant questions in Explorer Mode.

def four_words(text)
  how_many_words(text, 4)
end
# 8. What's the total budget of our movies?

sum = 0

movies.collect{|film| film[:budget]}.each do |profit|
  sum += profit
end

puts "Our total budget is $#{sum}"

sum = 0

movies.each do |film|
  sum += film[:budget]
end

puts "Our total budget is $#{sum}"

sum = movies.inject(0){|sum, film| sum + film[:budget]}

puts "Our total budget is $#{sum}"

sum = movies
      .collect{|f| f[:budget]}
      .inject(:+)

puts "Our total budget is $#{sum}"


# 10. Write a method called `starring?` that takes an array of movies (say, `movies`) and a star's name and returns the title of movies starring said star. Use this to help output the above.

def starring?(actor, films)
  movies = films.select do |film|
          film[:stars].include? actor
        end
  movies.collect{|film| film[:title]}
end

# 9. For our `movies` array, produce an array grouped by each star. As in:

stars = movies.flat_map{|film| film[:stars]}.uniq

movies_by_star = stars.collect do |star|
                    {star: star, movies: starring?(star, movies)}
                  end

movies_by_star.each do |hash|
  puts "#{hash[:star]} starred in: #{hash[:movies].join(' and ')}"
end

# [
#   { :star => "Leonardo DiCaprio", :movies => [...]},
#   { :star => "Tom Hanks", :movies => [...]},
#   ...
# ]

# Use this new array to output a list of the stars and the movies they appear in to the command line.
# 11. What's the average budget for our movies?

puts "Our average budget is #{sum/movies.length.to_f}"

# 12. What's the median budget for our movies?

sorted = movies.sort_by{|film| film[:budget] }

median = sorted[(movies.length/2)][:budget]

puts "Our median budget is #{median}"
