require_relative 'basic_humanoid'
require_relative 'organic'
class Quadraped

  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  include BasicHumanoid
  include Organic

  undef_method :walk

  def leg_number
    4
  end

end
