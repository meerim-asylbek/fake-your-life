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

40.times do
  User.create(
    email: Faker::Internet.unique.email,
    password: 123456
  )
end

puts "40 users created"


ADDRESSES_YOUNG_BF = ["21, Warnemünder Straße", "8, Waldsteg", "34, Budapester Straße", "4, Waitzstraße", "19, Kressenweg"]
ADDRESSES_OLD_BF = ["19, Nicolaistraße", "30D, Malchower Weg", "105, Buschsperlingweg", "68, Roedernallee", "48, Schönhauser Straße"]
ADDRESSES_FAMILY = ["49, Reinickendorfer Straße", "Waschhaus, 42, Gartenstraße", "5, Muschelkalkweg", "2, Wartenburgstraße", "49, Fritz-Werner-Straße", "35A, Argoallee", "10, Goltzstraße", "5A, Selbhornweg", "14, Zepernicker Straße", "43, Straße 265"]

young_boyfriends = User.all.slice[19..23]
old_boyfriends = User.all.slice[24..29]
family = User.all.slice[30..39]

# Young boyfriends
young_boyfriends.each_with_index do |user, i|
  customer = Customer.create(
    first_name: Faker::Name.unique.male_first_name,
    last_name: Faker::Name.unique.last_name,
    address: ADDRESSES_YOUNG_BF[i],
    age: rand(18..35),
    user_id: user.id
  )
  avatar = URI.open("https://source.unsplash.com/random/450x450/?profile-man")
  customer.avatar.attach(io: avatar, filename: "image.png", content_type: "image/png")
  customer.save

  artist = Artist.create(
    name: customer.first_name,
    category: 'Boyfriend',
    address: customer.address,
    description: Faker::TvShows::Friends.quote,
    price: rand(99..299),
    age: customer.age,
    user_id: user.id
  )
  3.times do
    file = URI.open("https://source.unsplash.com/random/1250x720/?blogger-male")
    artist.photos.attach(io: file, filename: "image.png", content_type: "image/png")
    artist.save
  end
  i += 1
end

puts "5 young boyfriends created"
## Old boyfriends
old_boyfriends.each_with_index do |user, i|
  customer = Customer.create(
    first_name: Faker::Name.unique.male_first_name,
    last_name: Faker::Name.unique.last_name,
    address: ADDRESSES_OLD_BF[i],
    age: rand(36..60),
    user_id: user.id
  )
  avatar = URI.open("https://source.unsplash.com/random/450x450/?profile-man")
  customer.avatar.attach(io: avatar, filename: "image.png", content_type: "image/png")
  customer.save

  artist = Artist.create(
    name: customer.first_name,
    category: 'Boyfriend',
    address: customer.address,
    description: Faker::TvShows::Friends.quote,
    price: rand(99..299),
    age: customer.age,
    user_id: user.id
  )
  3.times do
    file = URI.open("https://source.unsplash.com/random/1250x720/?blogger-male")
    artist.photos.attach(io: file, filename: "image.png", content_type: "image/png")
    artist.save
  end
  i += 1
end

puts "5 older boyfriends created"

## Family
family.each_with_index do |user, i|
  customer = Customer.create(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    address: ADDRESSES_FAMILY[i],
    age: rand(18..60),
    user_id: user.id
  )
  avatar = URI.open("https://source.unsplash.com/random/350x350/?profile-person")
  customer.avatar.attach(io: avatar, filename: "image.png", content_type: "image/png")
  customer.save

  artist = Artist.create(
    name: customer.first_name,
    category: 'Family',
    address: customer.address,
    description: Faker::TvShows::Friends.quote,
    price: rand(99..299),
    age: customer.age,
    user_id: user.id
  )
  3.times do
    file = URI.open("https://source.unsplash.com/random/1250x720/?family")
    artist.photos.attach(io: file, filename: "image.png", content_type: "image/png")
    artist.save
  end
  i += 1
end

puts "10 family artists created"

puts "All customers created"

puts "All artists created"


# # Reviews for boyfriends
# 100.times do
#   Review.create(
#     comment: "Horse",
#     rating: "Animals",
#     customer_id: "horse.jpg",
#     artist_id: rand(100..300)
#   )
# end

 Add.create(
   name: "Horse",
   category: "Animals",
   picture_url: "horse.jpg",
   price: rand(100..300)
 )
 Add.create(
   name: "Limo",
   category: "Vehicles",
   picture_url: "limo.jpg",
   price: rand(300..1000)
 )
 Add.create(
   name: "Chocolates",
   category: "Food",
   picture_url: "chocolates.jpg",
   price: rand(20..200)
 )
 Add.create(
   name: "Picnic",
   category: "Food",
   picture_url: "picnic.jpg",
   price: rand(50..200)
 )
 Add.create(
   name: "Flowers",
   category: "Decoration",
   picture_url: "flowers.jpg",
   price: rand(50..300)
 )
 Add.create(
   name: "Forest house",
   category: "Location",
   picture_url: "location.jpg",
   price: rand(300..1000)
 )
 Add.create(
   name: "Photo pack",
   category: "Media",
   picture_url: "photo_pack.jpg",
   price: rand(100..1000)
 )
 Add.create(
   name: "Video pack",
   category: "Media",
   picture_url: "video_pack.jpg",
   price: rand(300..1000)
 )

 puts "Adds created"
