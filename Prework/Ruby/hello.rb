puts "Hello, world"

puts "I"
puts "like"
puts "pie."

print "Cookies"
print "are"
print "good"
print "too."

operation_result = 12 * 34
puts "Operation result is "
puts operation_result

a_string = "This is a String"
another_string = 'This is also String'
multiline_string = """
A long time ago in a galaxy far, far away...

It is a periof of civil war. Rebel
spaceships, striking from a hidden
base, have won their first victory
against the evil Galactic Empire.
"""

puts "Hello \nworld"

name ="Rafael"
puts "Hi #{name}"

puts "What's your name?"
name = gets.chomp
puts "Hello, #{name}."

puts "Give me a number"
first_number = gets.chomp.to_i
puts "Give me another number"
second_number = gets.chomp.to_i
puts "#{first_number} x #{second_number} = #{first_number * second_number}"


file_contents = IO.read("my_file.txt") #no such file
puts "The source file contains: #{file_contents}"

puts "What's your name?"
name = gets.chomp
IO.write("name.txt",name)






































