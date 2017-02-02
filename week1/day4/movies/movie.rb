require 'pry'

putter = Proc.new {|thing| puts thing.reverse }

class Movie
  include Comparable

  attr_accessor :title, :budget, :stars

  def initialize(title:, budget:, stars:)
    @title  = title
    @budget = budget
    @stars  = stars
  end

  def stars?(actor)
    stars.include? actor
  end

  def cheap?
    budget < 100
  end

  # def >(other)
  #   budget > other.budget
  # end
  #
  # def <(other)
  #   budget < other.budget
  # end
  #
  # def ==(other)
  #   (!(self.< other.budget)) && (!self.> other.budget)
  # end

  def <=>(other)
    if other.respond_to?(:budget)
      budget <=> other.budget
    else
      budget <=> other
    end
  end

  def to_s
    title
  end

  # def custom_respond_to?(meth)
  #   self.methods.include? meth
  # end

end

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

movie_objects = movies.collect do |film|
                  Movie.new(
                    film
                  )
                end

# binding.pry

class Politician

  def cheap?
    true
  end

  def title
    "Nonsense"
  end

  def stars?(arg)
    true
  end

end

movie_objects << Politician.new

cheapies = movie_objects.select(&:cheap?)

# &:cheap?
# proc = Proc.new {|thing| thing.cheap?}
# select{|film| proc.call(film)}

puts "Our cheap movies were: #{cheapies.join(" and ")}"

leos = movie_objects.select{|film| film.stars? "Leonardo DiCaprio"}.collect(&:title)

puts "Our Leo movies were: #{leos.join(" and ")}"
