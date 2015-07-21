

# puts "Creating players, tournaments and registrations"

# 10.times do
# 	player = Player.create(
# 		name: Faker::Name.first_name,
# 	)
# end


# 10.times do
# 	tournament = Tournament.create(
# 		name: Faker::Address.street_name,
# 	)
# end

Registration.destroy_all
puts "Destroying previous registrations"
puts "Creating registrations"



10.times do
	random_player = Random.rand(Player.count) + 1
	random_tournament = Random.rand(Tournament.count) +  1
	Registration.create(player_id: Player.find(random_player).id, 
				   tournament_id: Tournament.find(random_tournament).id)
end