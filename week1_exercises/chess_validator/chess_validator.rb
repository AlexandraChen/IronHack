require "awesome_print"
@board = [
	[:bR, :bN, :bB, :bQ, :bK, :bB, :bN, :bR],
	[:bP, :bP, :bP, :bP, :bP, :bP, :bP, :bP],
	[nil, nil, nil, nil, nil, nil, nil, nil],
	[nil, nil, nil, nil, nil, nil, nil, nil],
	[nil, nil, nil, nil, nil, nil, nil, nil],
	[nil, nil, nil, nil, nil, nil, nil, nil],
	[nil, nil, nil, nil, nil, nil, nil, nil],
	[:wP, :wP, :wP, :wP, :wP, :wP, :wP, :wP],
	[:wR, :wN, :wB, :wQ, :wK, :wB, :wN, :wR],	
]

class Board
	attr_accessor :board, :bR, :wR

	def initialize(height,width)
		@height = height
		@width = width
		@board = Array.new(@width){Array.new(@height)}
	end

	def set_rook
		@board[0][0] = :bR
		@board[7][7] = :wR
		#@board[0][4] = :bR
	end

	def print_board
		@board
	end

	#get position and status should be in another Class
	def get_position(piece) #gets the position of the piece
		position = []
		@board.each_with_index do |x, y| 
			if x.include?(piece) 
				position << x.index(piece)
				position << y 
			end  
		end
		position
	end

	def status_of_position(x,y) #checks if position is occupied
		piece = ""
		if @board[x][y] == nil
			nil
		else			
			"#{@board[x][y]} is in place."
			piece = @board[x][y]
		end
	end

end

class Rook
	ROOKS = [:bR,:wR]
	attr_accessor :origin, :destination
	def initialize (board, origin, destination)
		@board = board
		@origin =  origin #=> i.e [0,0]
		@destination =  destination
	end

	def moves
		if @origin[0] === @destination[0] || @origin[1] === @destination[1]
			#check_spaces
			"LEGAL"
		else
			"ILLEGAL"
		end
	end

	def check_spaces #checks the spaces that rook has to pass
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
	end

	def piece_setter # sets the new position if every space between the spaces
		#is equal to nil
		# p @@spaces
		# @@spaces.map! do |space|
		# 	status_of_position(space[0],space[1])# make this function available. maybe module?
		# end 

		if @board.status_of_position(@destination[0],@destination[1]) == nil
			@origin = @destination
		else
			@origin
		end
		@origin
	end
end


#alex = Board.new(8,8).status_of_position(0,0)
alex = Board.new(8,8)
alex.set_rook
ap alex.print_board,{:multiline => false}
#p alex.status_of_position(1,0)
ap alex.get_position(:bR), {:multiline => false}
alexgame = Rook.new(alex,[0,0],[0,4]) # origin should be taken from the board, not reseting it
ap alexgame.moves

ap alexgame.check_spaces, {:multiline => false}
ap alexgame.piece_setter , {:multiline => false}

#p alexgame.set_piece
#alex.print_board

#ap alex, {:multiline => false}

#alex.get_position(:wR)
# position = []
# alex.each_with_index do |x, y| 
# 	if x.include?(:wR) 
# 		position << x.index(:wR)
# 		position << y 
# 	end  
# end
# p position

# a = if @board[0][0] == nil
# 	"Empty"
# else
# 	@board[0][0] 
# end
# p a

#alex.status_of_position(0,0)






