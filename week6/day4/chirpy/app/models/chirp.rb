class Chirp < ApplicationRecord
  belongs_to :user

  delegate :avatar, to: :user

  # def avatar
  #   user.avatar
  # end

end
