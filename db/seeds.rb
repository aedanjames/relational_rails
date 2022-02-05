# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Fighter.destroy_all
Organization.destroy_all
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ufc = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
bellator = Organization.create!(name: "Bellator", year_founded: 2002, president: "Scott Coker", international: true)
becky = ufc.fighters.create!(name: "Becky", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
carlos = ufc.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: true)

chandler = bellator.fighters.create!(name: "Michael Chandler", height: 1.7, weight:155.0, reach: 65, stance: "orthodox", active: true)
venom = bellator.fighters.create!(name: "Michael Venom Page", height: 2.3, weight:165.0, reach: 70, stance: "southpaw", active: true)

@hotel = Hotel.create!(name: 'Hilton', five_stars: true, year_founded: 1980)
@suite_1 = Suite.create(name: '120', clean: true, number_of_beds: 4, hotel_id: @hotel.id)
@suite_2 = Suite.create(name: '121', clean: true, number_of_beds: 2, hotel_id: @hotel.id)
@suite_3 = Suite.create(name: '122', clean: true, number_of_beds: 1, hotel_id: @hotel.id)
@suite_4 = Suite.create(name: '123', clean: true, number_of_beds: 5, hotel_id: @hotel.id)
