# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(username: "muhamarief", email: "marief.rahman279@yahoo.com", password: "123123123", password_confirmation: "123123123", super_admin: true)

categories = {
  "Restaurants" => [
    "Cafe",
    "Western",
    "Asian",
    "Nightlife",
    "Fast Food",
    "Indonesian",
    "Bakery",
    "Vegetarian",
    "Kaki Lima",
  ],
  "Leisures" => [
    "Lapangan Futsal",
    "Lapangan Tenis",
    "Lapangan Badminton",
    "Studio Band",
    "Kolam Renang",
    "Karaoke",
    "Group Leisure",
    "Hiburan Lainnya"
  ],
  "Sports" => [
    "Kursus Futsal",
    "Kursus Renang",
    "Kursus Golf",
    "Kursus Badminton",
    "Kursus Tenis",
    "Gym",
    "Others"
  ]
}

categories.each do |key, value|
  category = Category.create!(name: key)
  value.each { |v| category.types.create!(name: v) }
end
