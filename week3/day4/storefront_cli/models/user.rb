class User < ActiveRecord::Base

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :restrict_with_error
  has_many :items, through: :orders

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i



end
