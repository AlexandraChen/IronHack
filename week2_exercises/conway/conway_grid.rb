class Grid
	attr_accessor :grid

	def initialize(height,width)
		@height = height
		@width = width
		@grid = Array.new(@width){Array.new(@height,0)}
	end

end

grid = Grid.new(8,8)
p grid