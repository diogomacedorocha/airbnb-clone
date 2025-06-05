require "open-uri"

puts "🧹 Cleaning database..."
Flat.destroy_all
User.destroy_all

puts "👤 Creating users..."
sarah = User.create!(email: "sarah@sarah.com", password: "123456", role: "guest")
toni = User.create!(email: "toni@toni.com", password: "123456", role: "host")
puts "✅ Created users: Sarah (#{sarah.id}), Toni (#{toni.id})"

def attach_photos(flat, urls)
  urls.each_with_index do |url, index|
    begin
      file = URI.open(url)
      flat.photos.attach(io: file, filename: "photo#{index + 1}.jpg", content_type: "image/jpg")
    rescue => e
      puts "⚠️  Failed to attach photo ##{index + 1} for #{flat.title}: #{e.message}"
    end
  end
end

puts "🏠 Creating flats..."

flats_data = [
  {
    title: "Charming Colonial Home in Havana",
    description: "Step into the 1950s in this colorful colonial gem with a leafy courtyard.",
    location: "Calle Obispo, Habana Vieja, La Habana, Cuba",
    price: 90,
    user: sarah,
    photos: [
      "https://images.pexels.com/photos/7058355/pexels-photo-7058355.jpeg",
      "https://images.pexels.com/photos/280232/pexels-photo-280232.jpeg"
    ]
  },
  {
    title: "Eco Dome in the Desert of Joshua Tree",
    description: "An off-grid, solar-powered dome home perfect for stargazing and solitude.",
    location: "6770 Mt Lassen Ave, Joshua Tree, CA 92252, USA",
    price: 150,
    user: toni,
    photos: [
      "https://images.pexels.com/photos/347141/pexels-photo-347141.jpeg",
      "https://images.pexels.com/photos/12969046/pexels-photo-12969046.jpeg"
    ]
  },
  {
    title: "Canal View Apartment in Amsterdam",
    description: "Gaze at the canals from your living room in this classic Dutch townhouse.",
    location: "Prinsengracht 263, 1016 GV Amsterdam, Netherlands",
    price: 245,
    user: sarah,
    photos: [
      "https://images.pexels.com/photos/271753/pexels-photo-271753.jpeg",
      "https://www.pexels.com/photo/buildings-near-a-body-of-water-3817790.jpeg"
    ]
  },
  {
    title: "Serene Retreat in the South Island",
    description: "Wood-beamed chalet nestled by the lake in New Zealand's Southern Alps.",
    location: "Queenstown Hill, Queenstown 9300, New Zealand",
    price: 260,
    user: toni,
    photos: [
      "https://images.pexels.com/photos/32390203/pexels-photo-32390203.jpeg",
      "https://images.pexels.com/photos/6466236/pexels-photo-6466236.jpeg"
    ]
  },
  {
    title: "Penthouse Overlooking Central Park",
    description: "Luxury penthouse with sweeping views of Central Park and Manhattan skyline.",
    location: "15 Central Park West, New York, NY 10023, USA",
    price: 620,
    user: sarah,
    photos: [
      "https://images.pexels.com/photos/6292341/pexels-photo-6292341.jpeg",
      "https://images.pexels.com/photos/1599791/pexels-photo-1599791.jpeg"
    ]
  },
  {
    title: "Parisian Charm in Le Marais",
    description: "Charming loft in the artistic and trendy Le Marais district of Paris.",
    location: "47 Rue Vieille du Temple, 75004 Paris, France",
    price: 310,
    user: toni,
    photos: [
      "https://images.pexels.com/photos/1320686/pexels-photo-1320686.jpeg",
      "https://images.pexels.com/photos/1714430/pexels-photo-1714430.jpeg"
    ]
  },
  {
    title: "Zen Retreat in Kyoto",
    description: "Relax in a tranquil traditional home with a private garden and tatami rooms.",
    location: "Higashiyama-ku, Kyoto 605-0846, Japan",
    price: 180,
    user: toni,
    photos: [
      "https://images.pexels.com/photos/16113006/pexels-photo-16113006.jpeg",
      "https://images.pexels.com/photos/3554424/pexels-photo-3554424.jpeg"
    ]
  },
  {
    title: "Luxury Dubai Skyscraper Flat",
    description: "Soaring above the city, this luxurious apartment is pure modern opulence.",
    location: "Burj Khalifa Blvd, Downtown Dubai - Dubai - United Arab Emirates",
    price: 540,
    user: sarah,
    photos: [
      "https://images.pexels.com/photos/32406259/pexels-photo-32406259.jpeg",
      "https://images.pexels.com/photos/18038065/pexels-photo-18038065.jpeg"
    ]
  },
  {
    title: "Timeless Elegance, A Historic Home in Spain",
    description: "Experience the charm of this beautifully preserved historic home in Spain.",
    location: "Calle San Juan 3, Cudillero, Asturias, Spain",
    price: 230,
    user: sarah,
    photos: [
      "https://images.pexels.com/photos/18845596/pexels-photo-18845596.jpeg",
      "https://images.pexels.com/photos/4050318/pexels-photo-4050318.jpeg"
    ]
  },
  {
    title: "Beach House on the Coast",
    description: "Wake up to ocean views in this dreamy beach house.",
    location: "9 Pier Approach, Bournemouth BH2 5AA, UK",
    price: 179,
    user: toni,
    photos: [
      "https://images.pexels.com/photos/18923572/pexels-photo-18923572.jpeg",
      "https://images.pexels.com/photos/3225531/pexels-photo-3225531.jpeg"
    ]
  },
  {
    title: "Modern Tokyo Apartment",
    description: "Stay in style in the heart of Tokyo with city skyline views.",
    location: "1 Chome-12-3 Dogenzaka, Shibuya City, Tokyo 150-0043, Japan",
    price: 150,
    user: sarah,
    photos: [
      "https://images.pexels.com/photos/18845596/pexels-photo-18845596.jpeg",
      "https://images.pexels.com/photos/31124097/pexels-photo-31124097.jpeg"
    ]
  },
  {
    title: "Cozy Cabin in the Rockies",
    description: "Escape into nature in this cozy Canadian wood cabin.",
    location: "211 Bear Street, Banff, AB T1L 1E4, Canada",
    price: 120,
    user: toni,
    photos: [
      "https://www.pexels.com/photo/canadian-tiny-house-19343430.jpeg",
      "https://images.pexels.com/photos/32380684/pexels-photo-32380684.jpeg"
    ]
  },
  {
    title: "Sunny Villa in Marrakech",
    description: "Enjoy the sun and culture in this stunning Moroccan villa.",
    location: "Rue Ibn Aicha, Gueliz, Marrakech 40000, Morocco",
    price: 200,
    user: toni,
    photos: [
      "https://images.pexels.com/photos/19795020/pexels-photo-19795020.jpeg",
      "https://images.pexels.com/photos/32390203/pexels-photo-32390203.jpeg"
    ]
  }
]

puts "👀 Seeding #{flats_data.size} flats..."

success_count = 0
error_count = 0

flats_data.each do |flat|
  begin
    created_flat = Flat.create!(
      title: flat[:title],
      description: flat[:description],
      location: flat[:location],
      price_per_night: flat[:price],
      user: flat[:user]
    )
    attach_photos(created_flat, flat[:photos])
    puts "✅ Created flat: #{created_flat.title} in #{created_flat.location}"
    success_count += 1
  rescue => e
    puts "❌ Failed to create flat: #{flat[:title]} — #{e.message}"
    error_count += 1
  end
end

puts "🎉 Seeding complete! ✅ #{success_count} flats created, ❌ #{error_count} errors."
puts "📊 Total flats in DB: #{Flat.count}"
