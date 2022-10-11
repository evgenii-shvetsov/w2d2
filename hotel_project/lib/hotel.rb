require_relative "room"

class Hotel
    attr_writer :name

  def initialize(name, rooms)
    @name = name
    @rooms = Hash.new()

    rooms.each do |key, value|
        @rooms[key] = Room.new(value)
    end
  end

  def name
    new_name = @name.split(" ").map {|word| word.capitalize}
    new_name.join(" ")
  end

  def rooms 
    @rooms
  end

  def room_exists?(name)
    if @rooms.has_key?(name)
        true
    else
        false
    end
  end

  def check_in(person, room_name)
    if room_exists?(room_name) == false
        p "sorry, room does not exist"
    else
        if @rooms[room_name].add_occupant(person) == true
            p "check in successful"
        else
            p "sorry, room is full"
        end
    end
  end

  def has_vacancy?
    # bool_val = true
    amount_of_rooms = @rooms.length
    amount_of_full_rooms = 0
    @rooms.each do |room_name, room_inst|
        if room_inst.full? == true
            amount_of_full_rooms += 1
        end
    end

    if amount_of_rooms == amount_of_full_rooms
        false
    elsif amount_of_full_rooms < amount_of_rooms
        true
    end

  end

  def list_rooms
    @rooms.each do |room_name, room_inst|
        puts room_name + ".* " + room_inst.available_space.to_s
    end
  end


end
