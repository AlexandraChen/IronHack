class Cell
  def initialize(state, neighbours)
    @state = state # either 1 or 0 for alive or dead
    @neighbours = neighbours # an array that represents the surrounding cells
  end

  def count_state_cell
    @@live = @neighbours.select {|cell| cell > 0 }
    @@dead = @neighbours.select {|cell| cell == 0 }
  end

  def regenerate
    count_state_cell
    if @state == 0
      if @@dead.length == 8
        return 0
      elsif @@dead.length == 5
        return 1
      end
    end

    if @state == 1
      if @@live.length == 2 || @@live.length == 3
        return 1
      elsif @@live.length > 3
        return 0
      elsif @@live.length <=2
        return 0
      end
    end

  end

end