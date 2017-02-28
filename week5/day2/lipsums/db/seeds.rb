# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Lipsum.create!(
  slug: "standard",
  body: "This is standard"
)

Lipsum.create!(
  slug: "hipster",
  body: "This is hipster"
)

Lipsum.create!(
  slug: "oldfashioned",
  body: "This is oldfashioned"
)
