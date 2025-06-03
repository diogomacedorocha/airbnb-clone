# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Flat.create(title: "Wonder Woman 1984", description: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", location: "Paris", price_per_night: 100, user_id: 1 )
Flat.create(title: "The Shawshank Redemption", description: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prisons", location: "Brussels", price_per_night: 85, user_id: 1)