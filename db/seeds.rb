require 'faker'
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning up database..."

Artist.destroy_all
Add.destroy_all
User.destroy_all

puts "Database cleaned"

User.create(
  email: "sebas@fake.com",
  password: 123456
)

User.create(
  email: "meerim@fake.com",
  password: 123456
)

10.times do
  User.create(
    email: Faker::Internet.email,
    password: 123456
  )
end

puts "Users created"

User.all.each do |user|
  artist = Artist.create(
    name: Faker::Name.unique.name,
    category: ['Boyfriend', 'Girlfriend', 'Family', 'Friends'].sample,
    address: Faker::Address.full_address,
    description: Faker::TvShows::Friends.quote,
    price: rand(20..1000),
    age: rand(18..100),
    user_id: user.id
  )
  2.times do
    file = URI.open("https://source.unsplash.com/random/500x500/?'#{artist.category}'")
    artist.photos.attach(io: file, filename: "image.png", content_type: "image/png")
    artist.save
  end
end

puts "Artists created"

User.all.each do |user|
  customer = Customer.create(
    first_name: Faker::Name.unique.name.split(" ")[0],
    last_name: Faker::Name.unique.name.split(" ")[1],
    address: Faker::Address.full_address,
    age: rand(18..100),
    user_id: user.id
  )
  avatar = URI.open("https://source.unsplash.com/random/100x100/?avatar")
  customer.avatar.attach(io: avatar, filename: "image.png", content_type: "image/png")
  customer.save
end

puts "Customers created"

# Add.create(
#   name: "Horse",
#   category: "Animals",
#   picture_url: "horse.jpg"
# )
# Add.create(
#   name: "Limo",
#   category: "Vehicles",
#   picture_url: "limo.jpg"
# )
# Add.create(
#   name: "Chocolates",
#   category: "Food",
#   picture_url: "chocolates.jpg"
# )
# Add.create(
#   name: "Picnic",
#   category: "Food",
#   picture_url: "picnic.jpg"
# )
# Add.create(
#   name: "Flowers",
#   category: "Decoration",
#   picture_url: "flowers.jpg"
# )
# Add.create(
#   name: "Forest house",
#   category: "Location",
#   picture_url: "location.jpg"
# )
# Add.create(
#   name: "Photo pack",
#   category: "Media",
#   picture_url: "photo_pack.jpg"
# )
# Add.create(
#   name: "Video pack",
#   category: "Media",
#   picture_url: "video_pack.jpg"
# )

# puts "Adds created"
