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
Add.destroy_all
User.destroy_all

puts "Database cleaned"

User.create(
  email: 'sebastian@fakeyourlife.com',
  password: '123456'
)

User.create(
  email: 'meerim@fakeyourlife.com',
  password: '123456'

)

User.create(
  email: 'sebas@fakeyourlife.com',
  password: '123456'
)

User.create(
  email: 'meer@fakeyourlife.com',
  password: '123456'
)


puts "Users created"

User.all.each do |user|
  2.times do
    Artist.create(
      name: Faker::Name.unique.name,
      category: ['Boyfriend', 'Girlfriend', 'Family', 'Friends'].sample,
      address: Faker::Address.full_address,
      description: Faker::TvShows::Friends.quote,
      price: rand(20..1000),
      age: rand(18..100),
      user_id: user.id
    )
  end
end

puts "Artists created"

Add.create(
  name: "Horse",
  category: "Animals",
  picture_url: "horse.jpg"
)
Add.create(
  name: "Limo",
  category: "Vehicles",
  picture_url: "limo.jpg"
)
Add.create(
  name: "Chocolates",
  category: "Food",
  picture_url: "chocolates.jpg"
)
Add.create(
  name: "Picnic",
  category: "Food",
  picture_url: "picnic.jpg"
)
Add.create(
  name: "Flowers",
  category: "Decoration",
  picture_url: "flowers.jpg"
)
Add.create(
  name: "Forest house",
  category: "Location",
  picture_url: "location.jpg"
)
Add.create(
  name: "Photo pack",
  category: "Media",
  picture_url: "photo_pack.jpg"
)
Add.create(
  name: "Video pack",
  category: "Media",
  picture_url: "video_pack.jpg"
)

puts "Adds created"
