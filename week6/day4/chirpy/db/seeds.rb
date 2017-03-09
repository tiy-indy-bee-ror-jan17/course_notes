# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do

  user = User.create!(
    username: Faker::Internet.user_name(nil, %w(-)),
    bio: Faker::TwinPeaks.quote,
    avatar: Faker::Avatar.image
  )

  rand(10..50).times do
    user.chirps.create!(
      body: Faker::Hipster.paragraph[0..159],
      created_at: rand(1..700).days.ago
    )
  end

end

users = User.all

25.times do
  users.sample.follow!(users.sample)
end
