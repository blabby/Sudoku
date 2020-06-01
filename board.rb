require_relative "tile.rb"
require "byebug"
class Board
    attr_accessor :grid
#Contains the tiles, the game board
def initialize
    @grid = Array.new(9) {Array.new(9, "")}
end

def render
    puts "   0  1  2  3  4  5  6  7  8   "
    @grid.each_with_index do |row, i1|
        puts "#{i1} #{row}"
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
            @grid[i1][i2] = Tile.new(array.shift).value
        end
    end
end

def guess(pos, value)
    @grid[pos.first][pos.last] = value
end

def solved?
    win_row? && win_col? && win_grid? && unique?
end

def win_row?
    array = (1..9).to_a
    @grid.each do |row|
        row.each do |col|
            return false if !array.include?(col)
        end
    end
    true
end

def win_col?
    array = (1..9).to_a
    @grid.transpose.each do |row|
        row.each do |col|
            return false if !array.include?(col)
        end
    end
    true
end

def win_grid?
#     X   Y
# 1. 0-2 0-2
# 2. 3-5 0-2
# 3. 6-8 0-2
# 4. 0-2 3-5
# 5. 3-5 3-5
# 6. 6-8 3-5
# 7. 0-2 6-8
# 8. 3-5 6-8
# 9. 6-8 6-8
coordinates = [[(0..2).to_a,(0..2).to_a],[(3..5).to_a,(0..2).to_a],[(6..8).to_a,(0..2).to_a],[(0..2).to_a,(3..5).to_a],[(3..5).to_a,(3..5).to_a],[(6..8).to_a,(3..5).to_a],[(0..2).to_a,(6..8).to_a],[(3..5).to_a,(6..8).to_a],[(6..8).to_a,(6..8).to_a]]

coordinates.each do |subarray|
    return false if !unique_grid?(subarray.first, subarray.last)
end
    true
end

#Take the array of numbers, and keep passing them all into trystuff until they all return true or one returns false.

def unique_grid?(x_coordinates, y_coordinates)
    x= x_coordinates
    y = y_coordinates
    unique = {} 
    y.each do |row|
        x.each do |col|
            unique[@grid[row][col]] = 1
        end
    end
    return false if unique.keys.length != 9
    true
    end

def unique?
    unique_row && unique_col
end

def unique_row
    unique = {}
    @grid.each do |row|
        row.each do |col|
            unique[col] = 1
        end
    end
    return true if unique.keys.length == 9
    false
end

def unique_col
    unique = {}
    @grid.transpose.each do |row|
        row.each do |col|
            unique[col] = 1
        end
    end
    return false if unique.keys.length != 9
    true
end

end


g = Board.new
g.from_file("sudoku1.txt")
p g.solved?



