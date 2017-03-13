class Chirp < ApplicationRecord
  belongs_to :user

  delegate :avatar, to: :user

  default_scope { order(created_at: :desc) }

  # def avatar
  #   user.avatar
  # end

end
