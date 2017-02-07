class Coffee

  attr_accessor :drinks,
                :dose,
                :name

  def initialize(name, dose: 0.33, drinks: 3)
    @name = name
    @drinks = drinks
    @dose = dose
  end

  def full?
    drinks == 3
  end

  def empty?
    drinks == 0
  end

  def drink!
    self.drinks -= 1
  end

end
