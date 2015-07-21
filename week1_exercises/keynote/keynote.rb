require "terminfo"
require "pry"

class SlidesParser
	attr_accessor :arr_slides

	def initialize(file, separator)
		@file = IO.read(file)
		@separator = separator
		@arr_slides = []
	end

	def parser
        @arr_slides = @file.split(@separator).map do |line|
            line.strip
        end
	end
end

class Formatter
	def initialize(file)
		@arr_slides = file
	end

	def format
		terminal_size
		horizontal_centering
		vertical_centering
		ShowPresentation.new(@arr_slides).print_slides
	end

	def terminal_size
		terminal_size = TermInfo.screen_size
		@@height = terminal_size[0]
		@@width = terminal_size[1]
	end

	def horizontal_centering
		@arr_slides.map! do |line|
			horizontal = (@@width - line.length) / 2
			 " " * horizontal + line
		end
	end

	def vertical_centering
		@arr_slides.map! do |line|
			vertical = ((@@height / 2).floor) +
			 1
			"\n" * vertical + line + "\n" * vertical 
		end
	end
end

class ShowPresentation
	attr_accessor :arr_slides

	def initialize(arr_slides)
		@arr_slides = arr_slides
	end

	def print_slides
		@@current_slide = 0
		puts @arr_slides[@@current_slide]
		user_input
	end

	def user_input 
		loop do 
			print "> " 
			user_input = gets.chomp
			if user_input === "next"
				next_slide
			elsif user_input === "prev"
				prev_slide
			elsif user_input === "exit"
				break
			else
				puts @arr_slides[@@current_slide]
			end
		end
	end

	def next_slide
		puts @arr_slides[@@current_slide+1]
		@@current_slide += 1
		if @@current_slide === @arr_slides.length
			@@current_slide = 0
			puts @arr_slides[@@current_slide]
		end
	end

	def prev_slide
		puts @arr_slides[@@current_slide-1]
		@@current_slide -= 1
		if @@current_slide === -1
			@@current_slide = @arr_slides.length - 1
			puts @arr_slides[@@current_slide]
		end
	end
end

file = SlidesParser.new("keynote_slides.txt","----").parser
iTerm = Formatter.new(file)
iTerm.format


 

