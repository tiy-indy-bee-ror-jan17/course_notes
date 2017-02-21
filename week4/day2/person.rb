class Person

  def self.people
    %w(Kalea Nancy Rob Laura DavidM Demetra Kendrick Phil Ben Miguel Keith Michael DavidG)
  end

  def self.find(num)
    num = num.to_i
    people[num]
  end

end
