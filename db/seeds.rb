# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Fighter.destroy_all
Organization.destroy_all
Suite.destroy_all
Hotel.destroy_all

ufc = Organization.create!(name: "UFC", year_founded: 1995, president: "Dana White", international: true)
bellator = Organization.create!(name: "Bellator", year_founded: 2002, president: "Scott Coker", international: true)
invicta = Organization.create!(name: "Invicta FC", year_founded: 1999, president: "Cyborg", international: false)
one_championship = Organization.create!(name: "ONE Championship", year_founded: 2008, president: "Victor Cui", international: false)

zecky = ufc.fighters.create!(name: "Zecky", height: 14.0, weight:120.0, reach: 36, stance: "switch", active: false)
becky = ufc.fighters.create!(name: "Becky", height: 14.0, weight:120.0, reach: 36, stance: "orthodox", active: true)
carlos = ufc.fighters.create!(name: "Carlos Condit", height: 2.2, weight:170.0, reach: 70, stance: "orthodox", active: true)
rose = ufc.fighters.create!(name: "Rose Namajunas", height: 1.6, weight:125.0, reach: 60, stance: "orthodox", active: true)
bj_penn = ufc.fighters.create!(name: "BJ Penn", height: 1.9, weight:150.0, reach: 63, stance: "switch", active: false)


chandler = bellator.fighters.create!(name: "Michael Chandler", height: 1.7, weight:155.0, reach: 65, stance: "orthodox", active: true)
venom = bellator.fighters.create!(name: "Michael Venom Page", height: 2.3, weight:165.0, reach: 70, stance: "southpaw", active: true)
rory = bellator.fighters.create!(name: "Rory McDonald", height: 2.1, weight:190.0, reach: 67, stance: "switch", active: false)
pitbull = bellator.fighters.create!(name: "Patricio Pitbull", height: 1.9, weight:170.0, reach: 66, stance: "orthodox", active: true)

alesha = invicta.fighters.create!(name: "Alesha Zappitella", height: 1.3, weight:105.0, reach: 60, stance: "switch", active: true)
alexa = invicta.fighters.create!(name: "Alexa Culp", height: 1.5, weight:115.0, reach: 62, stance: "orthodox", active: true)
akeela = invicta.fighters.create!(name: "Akeela Al-Hameed", height: 1.4, weight:145.0, reach: 64, stance: "switch", active: true)
brogan = invicta.fighters.create!(name: "Brogan Walker-Sanchez", height: 1.3, weight:125.0, reach: 62, stance: "orthodox", active: true)

sam_a = one_championship.fighters.create!(name: "Sam-A", height: 1.6, weight:125.0, reach: 62, stance: "switch", active: true)
prajanchai = one_championship.fighters.create!(name: "prajanchai", height: 1.6, weight:130.0, reach: 64, stance: "switch", active: true)
dejdamrong = one_championship.fighters.create!(name: "Dejdamrong Sor Amnuaysirichoke", height: 1.6, weight:125.0, reach: 62, stance: "orthodox", active: true)
sam_a = one_championship.fighters.create!(name: "Nong-O", height: 1.7, weight:155.0, reach: 66, stance: "southpaw", active: true)
boop = one_championship.fighters.create!(name: "Boop Bop", height: 1.9, weight:195.0, reach: 69, stance: "orthodox", active: false)

hotel = Hotel.create!(name: 'The Plaza', five_stars: true, year_founded: 1907)
suite_1 = Suite.create(name: '279', clean: false, number_of_beds: 4, hotel_id: hotel.id)
suite_2 = Suite.create(name: '320', clean: true, number_of_beds: 2, hotel_id: hotel.id)
suite_3 = Suite.create(name: '281', clean: true, number_of_beds: 1, hotel_id: hotel.id)
suite_4 = Suite.create(name: '122', clean: false, number_of_beds: 5, hotel_id: hotel.id)


hotel_2 = Hotel.create!(name: 'Taj Mahal', five_stars: true, year_founded: 1930)
suite_1 = Suite.create(name: '220', clean: true, number_of_beds: 3, hotel_id: hotel_2.id)
suite_2 = Suite.create(name: '121', clean: false, number_of_beds: 2, hotel_id: hotel_2.id)
suite_3 = Suite.create(name: '222', clean: true, number_of_beds: 3, hotel_id: hotel_2.id)
suite_4 = Suite.create(name: '224', clean: false, number_of_beds: 5, hotel_id: hotel_2.id)


hotel_3 = Hotel.create!(name: 'The Hilltop Villa', five_stars: true, year_founded: 1990)
suite_1 = Suite.create(name: 'presidential', clean: true, number_of_beds: 2, hotel_id: hotel_3.id)
suite_2 = Suite.create(name: 'economy', clean: true, number_of_beds: 2, hotel_id: hotel_3.id)
suite_3 = Suite.create(name: 'honeymoon', clean: false, number_of_beds: 4, hotel_id: hotel_3.id)
suite_4 = Suite.create(name: 'executive', clean: false, number_of_beds: 5, hotel_id: hotel_3.id)


hotel_4 = Hotel.create!(name: 'Hotel Martinez', five_stars: true, year_founded: 1929)
suite_1 = Suite.create(name: '406', clean: false, number_of_beds: 4, hotel_id: hotel_4.id)
suite_2 = Suite.create(name: '107', clean: true, number_of_beds: 3, hotel_id: hotel_4.id)
suite_3 = Suite.create(name: '208', clean: false, number_of_beds: 3, hotel_id: hotel_4.id)
suite_4 = Suite.create(name: '229', clean: false, number_of_beds: 5, hotel_id: hotel_4.id)


hotel_5 = Hotel.create!(name: 'Burj Al-Arab', five_stars: true, year_founded: 1999)
suite_1 = Suite.create(name: '399', clean: false, number_of_beds: 4, hotel_id: hotel_5.id)
suite_2 = Suite.create(name: '240', clean: true, number_of_beds: 2, hotel_id: hotel_5.id)
suite_3 = Suite.create(name: '501', clean: false, number_of_beds: 1, hotel_id: hotel_5.id)
suite_4 = Suite.create(name: '202', clean: true, number_of_beds: 5, hotel_id: hotel_5.id)


hotel_6 = Hotel.create!(name: 'The Conrad', five_stars: true, year_founded: 2006)
suite_1 = Suite.create(name: '388', clean: true, number_of_beds: 4, hotel_id: hotel_6.id)
suite_2 = Suite.create(name: '349', clean: false, number_of_beds: 2, hotel_id: hotel_6.id)
suite_3 = Suite.create(name: '190', clean: true, number_of_beds: 1, hotel_id: hotel_6.id)
suite_4 = Suite.create(name: '291', clean: false, number_of_beds: 5, hotel_id: hotel_6.id)
