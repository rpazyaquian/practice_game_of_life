class GameOfLife
  def initialize(board)
    @board = board
  end

  def tick
    original_board = @board
    new_board = original_board.each_with_index.map do |row, y|
      row.each_with_index.map do |cell, x|
        next_status(cell, y, x)
      end
    end
    @board = new_board
  end

  def center_cell
    find_center_cell(@board)
  end

  def board
    @board
  end

  private

    def get_cell(y, x)
      if (y >= 0 && y < @board.length)
        if (x >= 0 && x < @board[y].length)
          return @board[y][x]
        end
      end
      return false
    end

    def find_center_cell(board)
      if (board.length % 2 != 0 && board.first.length % 2 != 0)
        y_center = board[board.length / 2]
        y_center[y_center.length / 2]
      else
        false
      end
    end

    def next_status(cell_status, y, x)
      live_neighbors = live_neighbors(y, x)
      if cell_status == 'x'
        (live_neighbors == 2 || live_neighbors == 3) ? 'x' : '.'
      elsif cell_status == '.'
        live_neighbors == 3 ? 'x' : '.'
      end
    end

    def live_neighbors(y, x)
      live_neighbors = 0

      all_neighbors = get_neighbors(y, x)

      all_neighbors.each do |neighbor|
        if neighbor == 'x'
          live_neighbors += 1
        end
      end

      live_neighbors
    end

    def get_neighbors(y, x)

      neighbors = []

      offsets = [
        [1, 1],
        [0, 1],
        [-1, 1],
        [1, -1],
        [0, -1],
        [-1, -1],
        [1, 0],
        [-1, 0]
      ]

      offsets.each do |offset|
        y_offset = offset[0]
        x_offset = offset[1]
        neighbor = get_cell(y+y_offset, x+x_offset)
        if neighbor
          neighbors << neighbor
        end
      end

      neighbors
    end
end