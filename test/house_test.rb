require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'
require 'pry'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
  end
  def extra_setup
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)
  end
  def test_it_exists
    assert_instance_of House, @house
  end
  def test_it_has_price
    assert_equal "$400000", @house.price
  end
  def test_it_has_address
    assert_equal "123 sugar lane", @house.address
  end
  def test_it_initializes_room_array
    assert_equal [], @house.rooms
  end
  def test_it_adds_rooms
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    @house.add_room(room_1)
    @house.add_room(room_2)
    assert_equal room_1, @house.rooms[0]
    assert_equal room_2, @house.rooms[1]
  end
  def test_it_find_rooms_from_category
    extra_setup
    assert_equal 2, @house.rooms_from_category(:bedroom).count
    assert_equal 1, @house.rooms_from_category(:basement).count
  end
  def test_it_finds_house_area
    extra_setup
    assert_equal 1900, @house.area
  end
  def test_it_finds_price_per_square_foot
    extra_setup
    assert_equal 210.53, @house.price_per_square_foot
  end
  def test_it_sorts_rooms_by_area
    extra_setup
    room_array = @house.rooms_sorted_by_area
    area_array = room_array.map { |room| room.area }
    assert_equal 4, area_array.size
  end
  def test_it_sorts_rooms_by_category
    extra_setup
    room_array = @house.rooms_by_category
    assert_equal 4, room_array.size
  end

end
