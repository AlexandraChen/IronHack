require "awesome_print"

class ChessParser
	attr_accessor :arr_slides

	def initialize(file)
		@file = IO.read(file)
		@arr_slides = []
	end

	def parser
        @arr_slides = @file.split.map do |line|
            line.split ""
        end
      	@arr_slides.each_slice(2).to_a
	end

end

chess = ChessParser.new("simple_moves.txt")
ap chess.parser , {:multiline => false}

