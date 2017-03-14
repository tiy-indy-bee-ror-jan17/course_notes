class User < ApplicationRecord
  has_many :chirps
  has_secure_password

  acts_as_follower
  acts_as_followable

  # default_scope { where(active: true) }

  # User.active
  # scope :active, -> { where(active: true) }

  validates :username, :avatar, presence: true
  validates :username, uniqueness: true
  # validates_uniqueness_of :username

  # def avatar
  #   attributes["avatar"].blank? ? "https://robohash.org/#{username}.png" : attributes["avatar"]
  # end

  def to_s
    username
  end

end
