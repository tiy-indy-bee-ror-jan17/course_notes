class User < ApplicationRecord
  has_many :chirps

  acts_as_follower
  acts_as_followable
end
