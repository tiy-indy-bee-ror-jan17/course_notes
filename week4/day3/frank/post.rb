class Post < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true

  def as_json(arg)
    {
      title: title,
      id: id,
      body: body,
      reversed: title.reverse
    }
  end

end
