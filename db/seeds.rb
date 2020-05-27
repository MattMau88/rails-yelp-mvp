# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants incl. reviews..."

5.times do
  r = Restaurant.create!(name: Faker::TvShows::HowIMetYourMother.character,
                         address: Faker::Address.street_address,
                         phone_number: Faker::PhoneNumber.phone_number_with_country_code,
                         category: ["chinese", "italian", "japanese", "french", "belgian"].sample
                         )
  rand(2..5).times do
    Review.create!(content: Faker::TvShows::HowIMetYourMother.quote,
                    rating: rand(1..5),
                   restaurant_id: r.id)
  end
end
puts "Finished!"
