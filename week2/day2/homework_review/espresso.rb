require_relative 'coffee'

class Espresso < Coffee

  def initialize(name = "Espresso")
    super(name, dose: 0.4, drinks: 1)
  end

end
