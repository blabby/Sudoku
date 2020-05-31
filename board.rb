require_relative "tile.rb"
class Board
    attr_accessor :grid
#Contains the tiles, the game board
def initialize
    @grid = Array.new(9) {Array.new(9, "")}
end

def render
    @grid.each_with_index do |row, i1|
        p row
    end
end

def from_file(textfile)
     text_array = File.readlines(textfile).map(&:chomp).join("")
     text_array = text_array.split("")
     fill_grid(text_array.map(&:to_i))
end

def fill_grid(array)
    @grid.each_with_index do |row,i1|
        row.each_with_index do |col,i2|
            @grid[i1][i2] = array.shift
        end
    end
end

end


g = Board.new
g.from_file("sudoku1.txt")
g.render
