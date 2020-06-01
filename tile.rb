class Tile
    attr_reader :value, :changeable
#Each tile of the gameboard
def initialize(value)
    @value = value
    @changeable = true
    default_value?
end

def default_value?
    if @value != 0
        @changeable = false
    end

end

def value=(new_value) #might not need this method
    if @changeable == true
        @value = new_value
    else 
        puts "You cannot change this value"
    end
end
end