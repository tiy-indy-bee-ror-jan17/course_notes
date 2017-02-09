require_relative 'war_epic'

class AdventureWar < War

  def war
    self.wars += 1
    add_to_pot [player_one.draw]
    add_to_pot [player_two.draw]
    if pot.length > 4
      self.pot = []
    end
  end

end
