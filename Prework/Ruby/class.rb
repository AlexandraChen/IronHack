class Car
  def honk
    puts "Beeeeeeeeep!"
  end
end

my_car = Car.new

puts my_car.class
puts "cosa".class
puts 4.class

class Car
  @@total = 0

  def initialize(color)
    @color = color
    @@total = @@total + 1
  end

  def honk
    puts "Beeeeeeeeep!"
  end

  def print_color
    puts @color
  end

  def print_total
    puts "So far we've got #{@@total} cars."
  end
end

my_car = Car.new "red"
other_car = Car.new "rainbow"

other_car.print_total


class Car
  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def honk
    puts "Beeeeeeeeep!"
  end
end

my_car = Car.new "yellow"
other_car = Car.new "brown"

my_car.color = "grey"

puts my_car.color
puts other_car.color



class Animal
  def initialize(name)
    @name = name
  end

  def describe
    puts "This animal's name is #{@name}"
  end
end

class Dog < Animal
end

class Cat < Animal
end

class Human < Animal
  def initialize(name, salary)
    super(name)
    @salary = salary
  end

  def describe_with_salary
    puts "This human's name is #{@name} and its salary is #{@salary}"
  end
end

dog = Dog.new "Winston Furchill"
cat = Cat.new "David Meowie"
human = Human.new "Johnny Appleseed", 12000

dog.describe
cat.describe
human.describe
human.describe_with_salary

class Car
  attr_accessor :color

  @@total = 0

  def self.total
    return @@total
  end

  def initialize(color)
    @color = color
    @@total = @@total + 1
  end

  def honk
    puts "Beeeeeeeeep!"
  end
end

my_car = Car.new "red"
other_car = Car.new "rainbow"

puts "So far we've got #{Car.total} cars."
