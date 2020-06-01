require_relative "board.rb"
class Game
    attr_accessor :board
    def initialize
        @board = Board.new
    end

    def run
        welcome
        while 
    end

    def welcome
        puts "     Welcome to Sudoku!   "
        puts "  Please fill in the 0s below  "
        render
        while !win? || !lose?
            position = get_position
            place_value(position)
        end
    end

    def render
        @board.render
    end

    def get_position
        puts "Please enter position on board (Ex: 0 0 to get first position)"
        position = gets.chomp.split(" ").map(&:to_i)
    end

    def place_value(pos, new_value)
        @grid[pos.first][pos.last] =  valid_value(new_value) # need to account for unchangeable tiles
    end

    def valid_value(value)
        valid_numbers = (1..9).to_a
        while !valid_numbers.include?(value)
            puts "Please enter a value between 1-9"
            value = gets.chomp.to_i
        end
        value
    end
#To play game --> just runs the game
#prompt then pass into board method guess(pos, value)
#valid? method to check that its a number between 1-9 inclusive
#at the very end, check if board is full, if board is full but you didnt win, say you messed up somewhere, maybe restart?
#Also for tiles, make sure that some of them cant be changed if you got that value from the file (IE not 0)
end

g = Game.new
g.board.from_file("sudoku1.txt")
g.run