# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating players, tournaments and registrations"

10.times do
	player = Player.create(
		name: Faker::Name.first_name,
	)
end


10.times do
	tournament = Tournament.create(
		name: Faker::Address.street_name,
	)
end

