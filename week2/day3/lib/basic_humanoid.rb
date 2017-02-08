module BasicHumanoid

  attr_accessor :name, :height

  def initialize(name, height)
    @name = name
    @height = height
  end

  def walk(miles=5000)
    "I would walk #{miles} miles ..."
  end

  def kill(other)
    other.kill! if killable.include? other.class
  end

  def killable
    [Human] + Quadraped.descendants
  end

  def leg_number
    2
  end

end
