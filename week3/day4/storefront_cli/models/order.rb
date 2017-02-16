class Order < ActiveRecord::Base

  belongs_to :user
  belongs_to :item

  validates :user, presence: true
  validates :item, presence: true
  validates :quantity, numericality: true, presence: true

  def destroy
    false
  end

end
