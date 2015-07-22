# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Creating new users!"
name = %w(Alexandra Llorenc Will Pete Tony Jenny Alex Adreu Eliza Shannon Nacho Jose Warwick Bogdan Baptiste)
last_name = %w(Chen Eisteibar Sanchez Cravens Quintero Sullivan Burke Cohen Henao)
email = %w(@gmail.com @hotmail.com @yahoo.com)


10.times do 
	user = User.create(name: "#{name.sample} #{last_name.sample}", email: "#{name.sample}#{email.sample}")
end