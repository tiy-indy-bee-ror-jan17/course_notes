class Note < ActiveRecord::Base

  belongs_to :user
  belongs_to :notable, polymorphic: true

  has_many :notes, as: :notable

  validates :user, presence: true
  validates :notable, presence: true

end
