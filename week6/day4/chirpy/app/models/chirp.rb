class Chirp < ApplicationRecord
  belongs_to :user

  delegate :avatar, to: :user

  default_scope { order(created_at: :desc) }

  # def avatar
  #   user.avatar
  # end

  def is_owner?(this_user)
    user == this_user
  end


end
