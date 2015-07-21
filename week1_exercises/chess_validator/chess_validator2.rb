
require "awesome_print"

class Board
	attr_accessor :board

	def initialize(height,width)
		@height = height
		@width = width
		@board = Array.new(@width){Array.new(@height)}
	end

	def run
		temporary_pieces
		print_board
		Checker.new(@board).empty_position?(0,0)
	end

	def temporary_pieces
		@board[0][0] = :bR
		@board[7][7] = :wR
	end

	def print_board
		 @board
	end
end

class Rook
	attr_accessor :origin, :destination, :board

	def initialize (board, origin, destination)
		@board = board
		@origin =  origin #=> i.e [0,0]
		@destination =  destination
	end

	def valid_move?
		if @origin[0] === @destination[0] || @origin[1] === @destination[1]
			#empty_position?
			#empty_path?
			"Valid move"
			path_checker
		else
			"Invalid move"
		end
	end


	def path_checker #checks the spaces that rook has to pass
		@@x_spaces = []
		@@y_spaces = []
		if @origin[0] === @destination[0]
			@@y_spaces = (@origin[1]+1..@destination[1]).to_a
			@@y_spaces
		else @origin[1] === @destination[1]
			@@x_spaces = (@origin[0]+1..@destination[0]).to_a
			@@x_spaces
		end
		spaces_counter
	end

	def spaces_counter #prints the spaces between the movess
		@@spaces = []
		if @@x_spaces.empty?
			@@y_spaces.each do |y|
				@@spaces << [@origin[0], y]
			end
		else
			@@x_spaces.each do |x|
				@@spaces << [x, @origin[1]]
			end
		end
		@@spaces 
		path_empty?# path to destination
	end

	def path_empty?
		path = []
		ap @@spaces, {:multiline => false}
		@@spaces.each do |space|
			path << empty_position?(space[0],space[1])
		end
		path
	end

	def empty_position?(x,y) 
		ap @board #=> this is returning the instance, why??
		if @board[x][y] == nil
			nil
		else			
			puts "A #{@board[x][y]} is in place."
			@board[x][y]
		end
	end

end



# ale = Board.new(8,8)
# ap ale.run, {:multiline => false}

ale = Board.new(8,8)
ap ale.temporary_pieces, {:multiline => false}
#ap ale.print_board, {:multiline => false}


rook = Rook.new(ale,[0,0],[0,4])
ap rook.valid_move?, {:multiline => false}














