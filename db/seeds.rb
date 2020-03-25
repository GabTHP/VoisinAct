
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Project.destroy_all
User.destroy_all
City.destroy_all

5.times do
  City.create(
    'name' => Faker::Address.city,
    'zip_code' => Faker::Address.zip,
  )
end

1.times do
  User.create(
    'first_name' => "Admin",
    'last_name' => "Admin",
    'description' => "You are running admin profile",
    'email' => "admin@voisinact.fr",
    'password' => "adminpass",
    'city_id' => City.all.sample.id,
    'admin' => true 
  )
end

10.times do
  User.create(
    'first_name' => Faker::Name.first_name,
    'last_name' => Faker::Name.last_name,
    'description' => Faker::GreekPhilosophers.quote,
    'email' => Faker::Internet.email,
    'password' => Faker::String.random(length: 6),
    'city_id' => City.all.sample.id
  )
end

15.times do
  Project.create(
    'title' => Faker::Lorem.word,
    'description' => Faker::Lorem.paragraph,
    'location' => Faker::Address.street_address,
    'number_of_participants' => Faker::Number.between(from: 1, to: 20),
    'amount_needed' => Faker::Number.between(from: 4000, to: 8000),
    'city' => City.all.sample,
    'architect' => User.all.sample,
    'amount_state' => Faker::Number.between(from: 0, to: 3000),
    'deadline' => Faker::Date.forward(days: 23),

  )
end

55.times do
  Project.create(
    'title' => Faker::Lorem.word,
    'description' => Faker::Lorem.paragraph,
    'location' => Faker::Address.street_address,
    'number_of_participants' => Faker::Number.between(from: 1, to: 20),
    'amount_needed' => Faker::Number.between(from: 4000, to: 8000),
    'city' => City.all.sample,
    'architect' => User.all.sample,
    'amount_state' => Faker::Number.between(from: 0, to: 3000),
    'deadline' => Faker::Date.backward(days: 60)

  )
end

puts "seed complete chief"

