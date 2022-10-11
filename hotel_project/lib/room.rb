class Room

attr_reader :capacity, :occupants
  
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        if @occupants.length < @capacity
            false
        elsif @occupants.length == @capacity
            true
        end
    end

    def available_space
        available = @capacity - @occupants.length
        available
    end

    def add_occupant(person_name)
        if full? == false
            @occupants << person_name
            true
        else
            false
        end
    end

end