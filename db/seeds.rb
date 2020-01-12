# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  { email: "eugesma@gmail.com", password: '12345678' }, 
  { email: "paul.18.sma@gmail.com", password: '12345678' }
])

User.first.add_role :admin
User.first.save
User.second.add_role :admin
User.second.save

# Initialize some store types
StoreType.create([
  { name: "Almacén"},
  { name: "Kiosco"},
  { name: "Vidriería" }
])

# Initialize some stores
Store.create([
  { name: "Lighuen", store_type: StoreType.find_by_name("Vidriería"), cuit: "Faker::Number.number(11)", address: "Gral. Roca 1028" },
  { name: "Los Lagos", store_type: StoreType.find_by_name("Kiosco"), cuit: "Faker::Number.number(11)", address: "Av. San Martín 837" }
])

20.times {
  Client.create!([
    { fullname: Faker::TvShows::GameOfThrones.character, email: Faker::Internet.email, store: Store.first }
  ])
}
20.times {
  Client.create!([
    { fullname: Faker::TvShows::GameOfThrones.character, email: Faker::Internet.email, store: Store.second }
  ])
}

Product.create([
  {name: "Coca-Cola", code: "0830-1", cost_price: 30.45, sale_price: 60.30, store_price: 78.45},
  {name: "Pepsi", code: "0831-1", cost_price: 31.45, sale_price: 61.30, store_price: 79.45},
  {name: "Fanta", code: "0832-1", cost_price: 32.45, sale_price: 62.30, store_price: 79.99},
  {name: "Sprite", code: "0833-1", cost_price: 30.45, sale_price: 60.30, store_price: 78.45}
])
