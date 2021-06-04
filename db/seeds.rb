# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


locations = Location.create([
  { city: 'Antigua', country: 'Guatemala' },
  { city: 'Bocas Del Toro', country: 'Panama' },
  { city: 'Cancun', country: 'Mexico' },
  { city: 'Cartagena', country: 'Columbia' },
  { city: 'Granada', country: 'Nicaragua' }
])

locations.each do |location|
  room1 = Room.create!(location: location, room_type: 'dorm', price_cents: 1000)
  Rooms::InventoriesCreatorService.new(room1, Time.zone.now + 2.month).call

  room2 = Room.create!(location: location, room_type: 'privat', price_cents: 2000)
  Rooms::InventoriesCreatorService.new(room2, Time.zone.now + 2.month).call

  room3 = Room.create!(location: location, room_type: 'deluxe', price_cents: 3000)
  Rooms::InventoriesCreatorService.new(room2, Time.zone.now + 2.month).call

  Activity.create!(location: location, name: FFaker::FreedomIpsum.word, price_cents: 1500)
  Activity.create!(location: location, name: FFaker::FreedomIpsum.word, price_cents: 1500)
  Activity.create!(location: location, name: FFaker::FreedomIpsum.word, price_cents: 1500)
  Activity.create!(location: location, name: FFaker::FreedomIpsum.word, price_cents: 1500)
end
