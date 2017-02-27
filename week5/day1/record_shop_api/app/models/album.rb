class Album < ApplicationRecord

  belongs_to :artist, counter_cache: true

end
