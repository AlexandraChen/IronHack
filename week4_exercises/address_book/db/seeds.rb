# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Creating new contacts"

#Contact.destroy_all

numbers = 10

def  name_generator
	consonant = %w[b c d f g h j k l m n p q r s t u v w x y z]
	vowel = %w(a e i o u)

	"#{consonant.sample}#{vowel.sample}#{consonant.sample}#{vowel.sample}#{consonant.sample}#{vowel.sample}"
end

def address_generator
	street = %w(1 2 3 4 5 6 7 8 9 0)
	place = %w(Marina Panama Casp Marina Sherlock 5th)
	city = %w(Panama New_York Barcelona Mexico England)

	"#{place.sample} #{street.sample}#{street.sample}#{street.sample}, #{city.sample}"
end

def phone_generator
	number = %w(1 2 3 4 5 6 7 8 9 0)
	"#{number.sample}#{number.sample}#{number.sample}#{number.sample}-#{number.sample}#{number.sample}#{number.sample}#{number.sample}"
end

def email_generator
	number = %w(1 2 3 4 5 6 7 8 9 0)
	consonant = %w[b c d f g h j k l m n p q r s t u v w x y z]
	vowel = %w(a e i o u)
	email= %w(gmail hotmail yahoo)

	"#{consonant.sample}#{vowel.sample}#{consonant.sample}#{vowel.sample}#{number.sample}@#{email.sample}.com"
end

numbers.times do |num|
	Contact.create!(name: name_generator, 
		address: address_generator, 
		phone1: phone_generator,
		email1: email_generator)
end


