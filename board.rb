class Board

    def initialize
        @grid = Array.new(3) { Array.new(3, '_') }
    end

    def print
        @grid.each { |row| puts row.join(" ") }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid?(pos)
        row, col = pos
        pos.all? { |i| i < @grid.length && i >= 0 }
    end

    def empty?(pos) # An array of integers representing row and column is passed into this method
        self[pos] == '_'
    end

    def set_mark(pos, mark)
        raise "Invalid input!" if !valid?(pos) && !empty?(pos)
        self[pos] = mark 
    end

    def row_win?(mark)
        @grid.any? { |row| row.all? { |ele| ele == mark } }
    end

    def col_win?(mark)
        @grid.transpose.any? { |col| col.all? { |ele| ele == mark } }
    end

    def diagonal_win?(mark)
      diagonal =  (0...@grid.length).all? do |i| 
        pos = [i, i]
        self[pos] == mark 
      end
      
      flipped_diagonal = (0...@grid.length).all? do |i|
        row = i
        col = @grid.length - 1 - i
        pos = [row, col]
        self[pos] == mark
      end
        
      diagonal || flipped_diagonal
    end

    def win?(mark)
        row_win?(mark) || col_win?(mark) || diagonal_win?(mark)
    end

    def all_used?
        @grid.all? { |row| row.all? { |ele| ele != '_' } }
    end

    def debug_fill_all(mark)
        @grid.each { |row| row.each_with_index { |ele, i| row[i] = mark } }
    end


end