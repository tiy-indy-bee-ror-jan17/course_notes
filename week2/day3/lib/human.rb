require_relative 'basic_humanoid'
require_relative 'organic'
require_relative 'record_keeping'

class Human

  extend RecordKeeping

  include BasicHumanoid
  include Organic

  def initialize(name, height)
    super(name, height)
    self.class.current_population << self
  end

end
