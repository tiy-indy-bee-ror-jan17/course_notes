class Human
  attr_accessor :name,
                :alertness,
                :cup

  def initialize(name, alertness=0)
    self.name = name
    self.alertness = alertness
  end

  def has_coffee?
    cup && !cup.empty?
  end

  def needs_coffee?
    # 0.33 => true
    # 0.66 => false
    alertness < 0.6
  end

  def buy(coffee)
    self.cup = coffee
  end

  def drink!
    if cup.empty?
      "You need to buy moar coffee"
    elsif (alertness + 0.33) > 1.5
      "STAHP. SEEK MEDICAL ATTENTION"
    else
      self.alertness += cup.dose
      cup.drink!
    end
  end


end
