require 'active_record'
require './dev_connection'

class Lorem < ActiveRecord::Base

  validates :title, presence: true

  def as_json(arg)
    {
      title: title,
      body: body
    }
  end

  def author
    "Chris Vannoy"
  end

end
