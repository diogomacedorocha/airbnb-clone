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
      title: "Scandinavian Style Loft in Stockholm",
      description: "Minimalist, cozy, and bright loft with panoramic views of the Baltic Sea.",
      location: "Skeppargatan 104, Östermalm, 114 59 Stockholm, Sweden",
      price: 220,
      user: toni,
      photos: [
        "https://images.unsplash.com/photo-1600585153880-507e285a13ec",
        "https://images.unsplash.com/photo-1578898887777-d55f3c2d25f4"
      ]
    },
    {
      title: "Charming Colonial Home in Havana",
      description: "Step into the 1950s in this colorful colonial gem with a leafy courtyard.",
      location: "Calle Obispo, Habana Vieja, La Habana, Cuba",
      price: 90,
      user: sarah,
      photos: [
        "https://images.unsplash.com/photo-1580338473444-4ef5323d6503",
        "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"
      ]
    },
    {
      title: "Eco Dome in the Desert of Joshua Tree",
      description: "An off-grid, solar-powered dome home perfect for stargazing and solitude.",
      location: "6770 Mt Lassen Ave, Joshua Tree, CA 92252, USA",
      price: 150,
      user: toni,
      photos: [
        "https://images.unsplash.com/photo-1600585154344-4f6d602d25a2",
        "https://images.unsplash.com/photo-1606788075540-78d88b885d14"
      ]
    },
    {
      title: "Canal View Apartment in Amsterdam",
      description: "Gaze at the canals from your living room in this classic Dutch townhouse.",
      location: "Prinsengracht 263, 1016 GV Amsterdam, Netherlands",
      price: 245,
      user: sarah,
      photos: [
        "https://images.unsplash.com/photo-1538474705339-e87de81450e8",
        "https://images.unsplash.com/photo-1512917774080-9991f1c4c750"
      ]
    },
    {
      title: "Serene Retreat in the South Island",
      description: "Wood-beamed chalet nestled by the lake in New Zealand's Southern Alps.",
      location: "Queenstown Hill, Queenstown 9300, New Zealand",
      price: 260,
      user: toni,
      photos: [
        "https://images.unsplash.com/photo-1581067725367-dada1a3d2d35",
        "https://images.unsplash.com/photo-1600585154344-4f6d602d25a3"
      ]
    },
    {
    title: "Penthouse Overlooking Central Park",
    description: "Luxury penthouse with sweeping views of Central Park and Manhattan skyline.",
    location: "15 Central Park West, New York, NY 10023, USA",
    price: 620,
    user: sarah,
    photos: [
      "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85",
      "https://images.unsplash.com/photo-1572120360610-d971b9b78808"
    ]
  },
  {
    title: "Parisian Charm in Le Marais",
    description: "Charming loft in the artistic and trendy Le Marais district of Paris.",
    location: "47 Rue Vieille du Temple, 75004 Paris, France",
    price: 310,
    user: toni,
    photos: [
      "https://images.unsplash.com/photo-1585560931462-e24c3fb674df",
      "https://images.unsplash.com/photo-1568605114967-8130f3a36994"
    ]
  },
  {
    title: "Art Deco Studio in São Paulo",
    description: "An artist's dream: vibrant colors, mid-century furniture and rooftop garden views.",
    location: "Av. Paulista, 1578 - Bela Vista, São Paulo - SP, 01310-200, Brazil",
    price: 105,
    user: sarah,
    photos: [
      "https://images.unsplash.com/photo-1600566753742-8984ddc505a4",
      "https://images.unsplash.com/photo-1584673965207-48ec3d4f2d1e"
    ]
  },
  {
    title: "Zen Retreat in Kyoto",
    description: "Relax in a tranquil traditional home with a private garden and tatami rooms.",
    location: "Higashiyama-ku, Kyoto 605-0846, Japan",
    price: 180,
    user: toni,
    photos: [
      "https://images.unsplash.com/photo-1552634903-bdd3d17b457d",
      "https://images.unsplash.com/photo-1526481280690-7492f06b788f"
    ]
  },
  {
    title: "Luxury Dubai Skyscraper Flat",
    description: "Soaring above the city, this luxurious apartment is pure modern opulence.",
    location: "Burj Khalifa Blvd, Downtown Dubai - Dubai - United Arab Emirates",
    price: 540,
    user: sarah,
    photos: [
      "https://images.unsplash.com/photo-1600585154203-579f9f5c80b6",
      "https://images.unsplash.com/photo-1619115806125-f2e149bfa536"
    ]
  },
  {
    title: "Timeless Elegance, A Historic Home in Spain",
    description: "Experience the charm of this beautifully preserved historic home in Spain.",
    location: "Calle San Juan 3, Cudillero, Asturias, Spain",
    price: 230,
    user: sarah,
    photos: [
      "https://thesingular.space/uploads/imgen/2240-1-6.jpg",
      "https://images.unsplash.com/photo-1600585154340-be6161a56a0c"
    ]
  },
  {
    title: "Beach House on the Coast",
    description: "Wake up to ocean views in this dreamy beach house.",
    location: "9 Pier Approach, Bournemouth BH2 5AA, UK",
    price: 179,
    user: toni,
    photos: [
      "https://images.unsplash.com/photo-1615571022219-eb45cf7faa9d",
      "https://images.unsplash.com/photo-1528913775512-624d24b27b96"
    ]
  },
  {
    title: "Modern Tokyo Apartment",
    description: "Stay in style in the heart of Tokyo with city skyline views.",
    location: "1 Chome-12-3 Dogenzaka, Shibuya City, Tokyo 150-0043, Japan",
    price: 150,
    user: sarah,
    photos: [
      "https://images.unsplash.com/photo-1581142327439-4f8b1f3ee9d2",
      "https://images.unsplash.com/photo-1583337130417-3346a1fcdf8d"
    ]
  },
  {
    title: "Cozy Cabin in the Rockies",
    description: "Escape into nature in this cozy Canadian wood cabin.",
    location: "211 Bear Street, Banff, AB T1L 1E4, Canada",
    price: 120,
    user: toni,
    photos: [
      "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
      "https://images.unsplash.com/photo-1606788075761-3d8a62c6e29e"
    ]
  },
  {
    title: "Sunny Villa in Marrakech",
    description: "Enjoy the sun and culture in this stunning Moroccan villa.",
    location: "Rue Ibn Aicha, Gueliz, Marrakech 40000, Morocco",
    price: 200,
    user: toni,
    photos: [
      "https://images.unsplash.com/photo-1580631488242-3c20d4c54ef2",
      "https://images.unsplash.com/photo-1533587851505-4f26dc1d1c97"
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
