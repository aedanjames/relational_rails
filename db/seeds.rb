# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Fighter.destroy_all
Organization.destroy_all
Suite.destroy_all
Hotel.destroy_all
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ufc = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
bellator = Organization.create!(name: "Bellator", year_founded: 2002, president: "Scott Coker", international: true)
becky = ufc.fighters.create!(name: "Becky", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
carlos = ufc.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: true)

chandler = bellator.fighters.create!(name: "Michael Chandler", height: 1.7, weight:155.0, reach: 65, stance: "orthodox", active: true)
venom = bellator.fighters.create!(name: "Michael Venom Page", height: 2.3, weight:165.0, reach: 70, stance: "southpaw", active: true)

hotel = Hotel.create!(name: 'The Plaza', five_stars: true, year_founded: 1907)
suite_1 = Suite.create(name: '279', clean: true, number_of_beds: 4, hotel_id: hotel.id)
suite_2 = Suite.create(name: '280', clean: true, number_of_beds: 2, hotel_id: hotel.id)
suite_3 = Suite.create(name: '281', clean: true, number_of_beds: 1, hotel_id: hotel.id)
suite_4 = Suite.create(name: '282', clean: true, number_of_beds: 5, hotel_id: hotel.id)


hotel_2 = Hotel.create!(name: 'Taj Mahal', five_stars: true, year_founded: 1930)
suite_1 = Suite.create(name: '220', clean: true, number_of_beds: 3, hotel_id: hotel_2.id)
suite_2 = Suite.create(name: '221', clean: true, number_of_beds: 2, hotel_id: hotel_2.id)
suite_3 = Suite.create(name: '222', clean: true, number_of_beds: 3, hotel_id: hotel_2.id)
suite_4 = Suite.create(name: '223', clean: true, number_of_beds: 5, hotel_id: hotel_2.id)


hotel_3 = Hotel.create!(name: 'The Hilltop Villa', five_stars: true, year_founded: 1990)
suite_1 = Suite.create(name: '22', clean: true, number_of_beds: 2, hotel_id: hotel_3.id)
suite_2 = Suite.create(name: '23', clean: true, number_of_beds: 2, hotel_id: hotel_3.id)
suite_3 = Suite.create(name: '24', clean: true, number_of_beds: 4, hotel_id: hotel_3.id)
suite_4 = Suite.create(name: '25', clean: true, number_of_beds: 5, hotel_id: hotel_3.id)


hotel_4 = Hotel.create!(name: 'Hotel Martinez', five_stars: true, year_founded: 1929)
suite_1 = Suite.create(name: '406', clean: true, number_of_beds: 4, hotel_id: hotel_4.id)
suite_2 = Suite.create(name: '407', clean: true, number_of_beds: 3, hotel_id: hotel_4.id)
suite_3 = Suite.create(name: '408', clean: true, number_of_beds: 3, hotel_id: hotel_4.id)
suite_4 = Suite.create(name: '409', clean: true, number_of_beds: 5, hotel_id: hotel_4.id)


hotel_5 = Hotel.create!(name: 'Burj Al-Arab', five_stars: true, year_founded: 1999)
suite_1 = Suite.create(name: '199', clean: true, number_of_beds: 4, hotel_id: hotel_5.id)
suite_2 = Suite.create(name: '200', clean: true, number_of_beds: 2, hotel_id: hotel_5.id)
suite_3 = Suite.create(name: '201', clean: true, number_of_beds: 1, hotel_id: hotel_5.id)
suite_4 = Suite.create(name: '202', clean: true, number_of_beds: 5, hotel_id: hotel_5.id)


hotel_6 = Hotel.create!(name: 'The Conrad', five_stars: true, year_founded: 2006)
suite_1 = Suite.create(name: '388', clean: true, number_of_beds: 4, hotel_id: hotel_6.id)
suite_2 = Suite.create(name: '389', clean: true, number_of_beds: 2, hotel_id: hotel_6.id)
suite_3 = Suite.create(name: '390', clean: true, number_of_beds: 1, hotel_id: hotel_6.id)
suite_4 = Suite.create(name: '391', clean: true, number_of_beds: 5, hotel_id: hotel_6.id)
