pass = '12345678'

User.create!(
    first_name: 'Admin',
    last_name: 'Admin',
    password: pass,
    password_confirmation: pass,
    email: "admin@example.com",
    role: 1,
  )


5.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: pass,
    password_confirmation: pass,
    email: "#{i}" + "_vr@gmail.com",
    role: 0,
  )
  puts "create user ##{i}" if i
end

Drink.create(title: 'Cofee', dtype: :hot_drink, price: 0.7)
Drink.create(title: 'Tea', dtype: :hot_drink, price: 0.5)
Drink.create(title: 'Coca-cola', dtype: :cold_drink, price: 0.6)

Food.create(title: 'Soup', ftype: :main_course, price: 1.2)
Food.create(title: 'Salad', ftype: :first_course, price: 1.1)
Food.create(title: 'Fish', ftype: :main_course, price: 1.7)

Menu.create(title: 'Menu for 22.11', date: DateTime.now.to_date)