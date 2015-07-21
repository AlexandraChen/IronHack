def greet(name)
	puts "Hi, #{name}!"
end

greet("Rafa")
greet("Xavi")
greet("Isra")
greet("Fernando")


def square(number)
	return number * number
end

def multiply(a,b)
	return a * b
end

puts(square(22))
puts(square(1))
puts(square(10))

puts(multiply(3,2))
puts(multiply(10,3))


def power_formula(base_chemical)
  sugar = base_chemical * 500
  spice = sugar / 1000
  everything_nice = sugar / 100
  return sugar, spice, everything_nice
end


chemical_x = 10000
blossom, buttercup, bubbles = power_formula(chemical_x)

puts "Using the value #{chemical_x} as our base chemical"
puts "We get values of #{blossom} for blossom, #{buttercup} for buttercup, and #{bubbles} for bubbles."


# Does 12 equal 1?
puts 12 == 1

# Is 3 less than 4?
puts 3 < 4

# Is 12 greater than or equal to 12?
puts 12 >= 12

# Combining conditions with AND
puts true && true
puts false && true

# Combining conditions with OR
puts true || false
puts false || false


my_array = []

my_array << "A"
my_array.push "B"
my_array.push "C"

my_array.delete_at 2

puts my_array




my_hash = {}

my_hash["AST"] = "Asturias"
my_hash[2] = "Galicia"

puts my_hash["AST"]
puts my_hash[2]

puts my_hash


string = ""

# While the string's length is less than 10
while string.size < 10
  # Add an 'a'
  string = string + 'a'
end

puts "The final string is #{string}"


