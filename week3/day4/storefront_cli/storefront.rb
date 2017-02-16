require 'rubygems'
require 'bundler/setup'
require 'tty'
require 'active_record'
require 'sqlite3'
require 'pry'
require_relative 'models/user'
require_relative 'models/item'
require_relative 'models/address'
require_relative 'models/order'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/store.sqlite3'
)

# Your code here

binding.pry

puts User.count

Item.by_price.limit(5).each do |item|
  puts "#{item.title} :: #{item.price}"
end

book1 = Item.where(category: "Books").order(:price).first

puts "Our cheapest in 'Books' is #{book1.title}"

params = {}
params[:search] = "book"

book2 = Item.where(["category LIKE ?", "%#{params[:search]}%"]).order(:price).first

puts "Our cheapest in any 'Books' is #{book2.title}"

address = Address.find_by(
              street: "6439 Zetta Hills",
              city: "Willmouth",
              state: "WY"
             )

user = address.user

puts "#{user.first_name} #{user.last_name} lives there."

puts "She lives at #{user.addresses.count} addresses"

p user.addresses.where(state: "CA")

user = User.find_by(
                  first_name: "Virginie",
                  last_name: "Mitchell"
                 )

user.addresses.update(
  city: "New York",
  state: "NY",
  zip: 10108
)

# user.addresses.find_by(id: params[:id])
# SELECT * FROM addresses WHERE user_id = #{user.id} AND id = #{params[:id]}

puts Item.where("category LIKE ?", "%tool%").sum(:price)

puts Order.sum(:quantity)

item_start = Item.where("category LIKE ?", "%#{params[:search]}%")

p item_start.joins(:orders).sum("price * quantity")

user.items.each do |item|
  p item
end

# What item was ordered most often?

most_ordered = Order.joins(:item)
                    .order("sum_orders_quantity")
                    .reverse_order
                    .group(:title)
                    .sum("orders.quantity").first

puts "#{most_ordered.first} was ordered #{most_ordered.last} times."

# Grossed the most money?

most_ordered = Order.joins(:item)
                    .order("sum_items_price_all_orders_quantity")
                    .reverse_order
                    .group(:title)
                    .sum("items.price * orders.quantity").first

puts "#{most_ordered.first} made #{most_ordered.last}."


# What user spent the most?

spendy = User.joins(:items)
             .order("sum_items_price_all_orders_quantity")
             .reverse_order
             .group(:first_name, :last_name)
             .sum("items.price * orders.quantity").first

p spendy
puts "#{spendy.first.first} #{spendy.first.last} made us #{spendy.last}."


# What were the top 3 highest grossing categories?

cats = Item.joins(:orders)
           .order("sum_items_price_all_orders_quantity")
           .reverse_order
           .group(:category)
           .sum("items.price * orders.quantity").first(3)

cats.each do |category, revenue|
  puts "#{category} made us #{revenue}"
end


# Simulate buying an item by inserting a User from command line input (ask the user for their information) and an Order for that User (have them pick what they'd like to order and other needed order information).

tty = TTY::Prompt.new

first_name, last_name = tty.ask("What's yer name?").split(" ")
email = tty.ask("Email?")
user = User.new(
                    first_name: first_name,
                    last_name: last_name,
                    email: email
                  )

unless user.save
  p user.errors.full_messages
  exit
end

orderable_items = Item.five

selection = tty.select("What would you like to order", orderable_items)

quantity = tty.ask("How many?")

order = Order.new(
                      user: user,
                      item: selection,
                      quantity: quantity
                    )
unless order.save
  p order.errors.full_messages
end
