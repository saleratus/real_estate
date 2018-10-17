require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require 'pry'

class RoomTest < Minitest::Test

  def setup
    @room = Room.new(:bedroom, 10, 13)
  end
  def test_it_exists
    assert_instance_of Room, @room
  end
  def test_it_has_category
    assert_equal :bedroom, @room.category
  end
  def test_it_has_length
    assert_equal 10, @room.length
  end
  def test_it_has_width
    assert_equal 13, @room.width
  end
  def test_it_returns_area
    assert_equal 130, @room.area
  end

end
