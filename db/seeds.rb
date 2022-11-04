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

Add.destroy_all
Artist.destroy_all
Customer.destroy_all
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
    email: Faker::Internet.unique.email,
    password: 123456
  )
end

puts "Users created"

ADDRESSES = ["36, Schneeammerweg", "6, Saalburgstraße", "269, Blumberger Damm", "31A, Beuthener Straße", "34, Leo-Baeck-Straße", "53a, Otto-Nagel-Straße", "10, Goltzstraße", "2, Wartenburgstraße", "17, Ludwigsfelder Straße", "Charité-Campus Benjamin Franklin, 30, Hindenburgdamm", "11, Kerkowstraße", "10, Schwarzmeerstraße", "Sportplatz „Willi Sänger“, 186-216, Köpenicker Landstraße", "51, Schwabinger Weg", "22, Debussystraße", "25, Indira-Gandhi-Straße", "Kita - An den Achterhöfen, 1, An den Achterhöfen", "3A, Stolbergstraße", "228, Müggelseedamm", "Strandbad Tegelsee, 21, Schwarzer Weg"]

User.all.each_with_index do |user, i|
  customer = Customer.create(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    address: ADDRESSES[i], 
    age: rand(18..99),
    user_id: user.id
  )
  avatar = URI.open("https://source.unsplash.com/random/150x150/?profile")
  customer.avatar.attach(io: avatar, filename: "image.png", content_type: "image/png")
  customer.save

  artist = Artist.create(
    name: customer.first_name,
    category: ['Boyfriend', 'Girlfriend', 'Family', 'Friends'].sample,
    address: customer.address,
    description: Faker::TvShows::Friends.quote,
    price: rand(20..999),
    age: customer.age,
    user_id: user.id
  )
  3.times do
    file = URI.open("https://source.unsplash.com/random/1250x720/?'#{artist.category}'")
    artist.photos.attach(io: file, filename: "image.png", content_type: "image/png")
    artist.save
  end
  i += 1
end

puts "Customers created"

puts "Artists created"

 Add.create(
   name: "Horse",
   category: "Animals",
   picture_url: "horse.jpg",
   price: rand(5..100)
 )
 Add.create(
   name: "Limo",
   category: "Vehicles",
   picture_url: "limo.jpg",
   price: rand(5..100)
 )
 Add.create(
   name: "Chocolates",
   category: "Food",
   picture_url: "chocolates.jpg",
   price: rand(5..100)
 )
 Add.create(
   name: "Picnic",
   category: "Food",
   picture_url: "picnic.jpg",
   price: rand(5..100)
 )
 Add.create(
   name: "Flowers",
   category: "Decoration",
   picture_url: "flowers.jpg",
   price: rand(5..100)
 )
 Add.create(
   name: "Forest house",
   category: "Location",
   picture_url: "location.jpg",
   price: rand(5..100)
 )
 Add.create(
   name: "Photo pack",
   category: "Media",
   picture_url: "photo_pack.jpg",
   price: rand(5..100)
 )
 Add.create(
   name: "Video pack",
   category: "Media",
   picture_url: "video_pack.jpg",
   price: rand(5..100)
 )

 puts "Adds created"
