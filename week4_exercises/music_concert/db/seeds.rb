
puts "creating new concerts"


10.times do
	concert = Concert.create(
		band: Faker::Name.first_name,
		city: Faker::Address.city, 
		price: Faker::Number.decimal(2, 2),
		description: Faker::Lorem.paragraph,
		venue: Faker::Team.name,
		date: Faker::Date.forward(60)
	)
end