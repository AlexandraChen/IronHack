
# puts "Creating new users!"

# 10.times do
# 	User.create(
# 		name: Faker::Name.first_name,
# 		email: Faker::Internet.email,
# 		password: Faker::Internet.password
# 	)
# end

puts "Creating new products!"

Product.destroy_all

user_id_array = []

User.all.each do |user|
	user_id_array << user.id
end

10.times do
	Product.create(
		title:            Faker::Lorem.word,
		bidding_deadline: Faker::Date.forward(30),
		description:      Faker::Lorem.paragraph,
		user_id:          user_id_array.sample,
		price:            Faker::Number.decimal(2,2)
	)
end





#bidding_deadline: Faker::Date.forward(30) 	price: Faker::Number.decimal(2, 2),