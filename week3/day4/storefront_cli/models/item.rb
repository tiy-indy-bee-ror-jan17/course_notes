class Item < ActiveRecord::Base

  has_many :orders
  has_many :users, through: :orders

  validates :price, presence: true

  def self.by_price
   order(price: :desc)
  end

  def self.five
    by_price.limit(5)
  end


  def to_s
    title
  end

end
