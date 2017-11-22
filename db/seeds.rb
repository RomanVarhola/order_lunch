# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
pass = '12345678'

5.times do |i|
  User.create!(
    first_name:  Faker::Name.first_name,
    last_name:   Faker::Name.last_name,
    password:    pass,
    password_confirmation: pass,
    email:       "#{i}" + "_vr@gmail.com",
    role: 0,
  )
  puts "create user ##{i}" if i
end
