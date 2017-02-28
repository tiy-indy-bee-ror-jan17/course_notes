class Lipsum < ApplicationRecord

  validates :slug, :body, presence: true

  validates :slug, uniqueness: true

end
