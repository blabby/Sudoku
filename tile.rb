class Tile
    attr_reader :value
#Each tile of the gameboard
def initialize(value)
    @value = value
    @changeable = false
end

def default_value?
    if @value == 0
        @changeable = true
    end
end

def value=(new_value)
    if @changeable == true
        @value = new_value
    else 
        puts "You cannot change this value"
    end
end
end