require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning up database..."

Artist.destroy_all

puts "Database cleaned"

10.times do

  Artist.create(
    name: Faker::Name.unique.name,
    category: ['Boyfriend', 'Girlfriend', 'Family', 'Friends'].sample,
    address: Faker::Address.full_address,
    description: Faker::TvShows::Friends.quote,
    price: rand(20..1000),
    age: rand(18..100)
  )

end

puts "Artists created"
