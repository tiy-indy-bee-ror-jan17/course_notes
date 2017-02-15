class Team < ActiveRecord::Base

  belongs_to :conference

  def victories
    wins
  end

end
