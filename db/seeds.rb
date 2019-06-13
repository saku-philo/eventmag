# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rails.logger.debug 'create sample event data'

50.times do
  name = Faker::Restaurant.name
  place = Faker::Address.city
  image = ""
  date = "2019-06-30"
  start_at = "19:00"
  end_at = "20:00"
  link_url = Faker::Fillmurray.image
  cost = Faker::Number.number(4)
  capacity = Faker::Number.number(2)
  meta = Faker::Marketing.buzzwords
  Event.create!(name: name,
                place: place,
                image: image,
                date: date,
                start_at: start_at,
                end_at: end_at,
                link_url: link_url,
                cost: cost,
                capacity: capacity,
                meta: meta)
end
