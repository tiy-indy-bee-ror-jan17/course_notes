require 'minitest/autorun'
require 'active_record'
require 'sqlite3'

require_relative 'models/item'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/store.sqlite3'
)

class ItemTest < MiniTest::Test

  def test_five
    assert Item.five.count == 5
    assert Item.five.sort_by(&:price).reverse == Item.five.to_a
  end

  def test_price_is_required
    item = Item.new(category: "bleh", title: "rdghrt")
    refute item.save
    assert item.errors.full_messages.include?("Price can't be blank"), item.errors.full_messages
  end

  def test_item_has_orders
    item = Item.first
    refute item.orders.count == 0
  end

end
