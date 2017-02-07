require_relative 'coffee'

class Tea < Coffee

  def initialize(name = "Tea")
    super(name, dose: 0.25)
  end

end
