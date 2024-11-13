# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
puts "Cleaning the DB..."
Restaurant.destroy_all

restaurants = [
  { name: "Peking Perfection", address: "123 Dragon St", phone_number: "555-1234", category: "chinese" },
  { name: "Mamma Mia's Pizzeria", address: "45 Rome Rd", phone_number: "555-5678", category: "italian" },
  { name: "Sushi Sensation", address: "78 Tokyo Ave", phone_number: "555-8765", category: "japanese" },
  { name: "Le Petit Snail", address: "9 Rue de Paris", phone_number: "555-2345", category: "french" },
  { name: "Burrito Bliss", address: "101 Fiesta Ln", phone_number: "555-3456", category: "mexican" }
]

reviews = [
  { content: "Amazing flavors! Best I've ever had!", rating: 5 },
  { content: "Mediocre. Not what I expected at all.", rating: 2 },
  { content: "Incredible experience! I'll be back soon!", rating: 5 },
  { content: "Overpriced and bland. Very disappointed.", rating: 1 },
  { content: "Absolutely loved it! Highly recommended.", rating: 4 }
]

# Create restaurants and assign reviews
restaurants.each do |restaurant_data|
  restaurant = Restaurant.create!(restaurant_data)
  puts "\nAdded the restaurant #{ restaurant_data[:name] } with ratings: "

  # Assign five reviews to each restaurant
  reviews.each do |review_data|
    restaurant.reviews.create!(review_data)
    print "[#{review_data[:rating]}]"
  end
end
