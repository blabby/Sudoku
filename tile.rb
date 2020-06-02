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
end