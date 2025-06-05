# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

puts "Cleaning database..."
Flat.destroy_all
User.destroy_all

puts "Creating users..."
sarah = User.create!(email: "sarah@sarah.com", password: "123456", role: "guest")
toni = User.create!(email: "toni@toni.com", password: "123456", role: "host")
puts sarah.id

puts "Creating restaurants..."
spannish = Flat.create!(title: "Timeless Elegance, A Historic Home in the Heart of Spain", description: "Description: Step back in time and experience the charm of this beautifully preserved historic home in a quaint Spanish city. Full of character, rich heritage, and architectural beauty, this home offers a truly authentic and unforgettable stay.", location: "Cudillero, Spain", price_per_night: 230, user_id: sarah.id )
file = URI.parse("https://thesingular.space/uploads/imgen/2240-1-6.jpg").open
spannish.photos.attach(io: file, filename: "spannishhead.jpg", content_type: "image/jpg")
file = URI.parse("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.villasfincas.com%2F14781-historic-homes-andalucia-spain.html&psig=AOvVaw0GD9E97eaOh905P2zBbf4l&ust=1749138374488000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCOjqra6O2I0DFQAAAAAdAAAAABAV").open
spannish.photos.attach(io: file, filename: "spannisSecond.jpg", content_type: "image/jpg")
puts "Created Spannish"
beachhouse = Flat.create!(title: "Beach house directly on the coast", description: "Description: Welcome to your dream beach house on the pristine shores of Orange County! Wake up to the soothing sound of waves, sip your morning coffee with breathtaking ocean views, and embrace the laid-back luxury of coastal living.", location: "Bournemouth, UK", price_per_night: 178.67, user_id: toni.id )
file = URI.parse("https://images.unsplash.com/photo-1615571022219-eb45cf7faa9d?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
beachhouse.photos.attach(io: file, filename: "beachhead.jpg", content_type: "image/jpg")
file = URI.parse("https://images.unsplash.com/photo-1528913775512-624d24b27b96?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
beachhouse.photos.attach(io: file, filename: "beachSecond.jpg", content_type: "image/jpg")

puts "Finished! Created #{Flat.count} restaurants."
