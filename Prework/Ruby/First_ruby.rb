puts "Whats the source file?"
file = gets.chomp


puts "What is the destination file?"
destination = gets.chomp
IO.write(destination, IO.read(file))

puts IO.read(destination)