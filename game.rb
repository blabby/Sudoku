require_relative "board.rb"
class Game
    attr_reader :board
    def initialize
        @board = Board.new
    end

    def run
        welcome
        while !win? || !lose?
            puts "            "
            puts "            "
            render
            position = get_position
            value = get_value
            place_value(position, value)
            render
            break if win?
            break if lose?
        end 
        puts "Game Over!"
    end

    def welcome
        puts "     Welcome to Sudoku!   "
        puts "  Please fill in the 0s below  "
    end

    def render
        @board.render
    end

    def win?
        if @board.solved?
        puts "You Win!"
        return true
        end
        false
    end

    def lose?
        if @board.board_full?
            puts "You did not solve the puzzle."
            return true
        end
        false
    end

    def get_position
        puts "Please enter position on board (Ex: 0 0 to get first position)"
        position = gets.chomp.split(" ").map(&:to_i)
    end

    def get_value
        puts "Please enter a value between 1-9" 
        valid_nums = (1..9).to_a
        value = gets.chomp.to_i
        while !valid_nums.include?(value)
            puts "Please enter a value between 1-9"
            value = gets.chomp.to_i
        end
        value
    end

    def place_value(pos, new_value)
        if @board.changeable_tile?(pos)
        @board.display_grid[pos.first][pos.last] = valid_value(new_value) 
        else
            puts "You cannot change this value"
            sleep(1)
            puts "Please try again"
            false
        end
    end

    def valid_value(value)
        valid_numbers = (1..9).to_a
        while !valid_numbers.include?(value)
            puts "Number not valid. Please re-enter a value between 1-9"
            value = gets.chomp.to_i
        end
        value
    end
end

puts "Would you like to play Soduku: 1 or 2 or 3 (Enter a number)"
game = gets.chomp.to_i
g = Game.new
case game
when 1
    g.board.from_file("sudoku1.txt")
    g.run
when 2
    g.board.from_file("sudoku2.txt")
    g.run
when 3
    g.board.from_file("sudoku1.txt")
    g.run
end
