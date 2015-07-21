require 'pry'
class Room
	attr_accessor :exit, :name, :description

	def initialize (exit, name, description)
		@exit = exit
		@name = name
		@description = description
	end

end

class Game
	DIRECTIONS = ["N","S","E","W"]
	SPECIAL_COMMANDS = ["Eat", "Chill out", "Work"]
	LAST_ROOM = 5
	
	def initialize(rooms)
		@rooms = rooms
		@current_location = 0
		@user_command = ""
	end

	def start
		puts "Hello. let's play a game"
		puts "You can go North, East, West or South"
		puts "You can exit the game anytime writing Exit!"
		puts "Where do you want to go?"
		get_command
	end

	def get_command
		@user_command = gets.chomp
		check_command
	end

	def check_command

		if @user_command == "Exit!"
			exit
		end

		if DIRECTIONS.include?(@user_command)
			check_direction
		else
			puts "Invalid command. Please enter N, E, W or S" 
			get_command
		end
	end

	def check_direction
		if @rooms[@current_location].exit.include?(@user_command)
			@current_location += 1
			room_description
			get_command
		else
			puts "There is no exit to that direction"
			get_command
		end	
	end

	def room_description
		puts @rooms[@current_location].description
	end

	#check if last room matches with last location
	def last_room
		#how to make it loop and go back to room 1?

	end

end 



room1 = Room.new "E","Living Room", "You are in a room where you can chill out"
room2 = Room.new "N","Studio", "You are in a room with a computer."
room3 = Room.new "E", "Kitchen", "There's plenty of food in this room!"
room4 = Room.new "S", "Bathroom" , "There's some sunblock in the cabinet, you could go get tanned!"
room5 = Room.new "S", "Sundeck", "Remember to put on some sunblock!"

rooms = [room1, room2, room3, room4, room5]

user1 = Game.new(rooms)

user1.start


