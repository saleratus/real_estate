
class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.find_all { |room| room.category == category }
  end

  def area
    area = 0
    @rooms.each { |room| area += room.area }
    return area
  end

  def price_per_square_foot
    (@price[1..-1].to_f / self.area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by { |room| room.area }
  end

  def rooms_by_category
    @rooms.sort_by { |room| room.category }
  end

end
