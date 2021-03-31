require_relative 'bike'
class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise RuntimeError, "No Bikes Availiable" if empty? 
    @bike.pop
  end

  def dock(bike)
    raise RuntimeError, "Docking station is full" if full?
    @bikes << bike
  end
  
  private
  def full?
    @bikes.size >= @capacity ? true : false
  end 

  def empty?
    @bikes.empty? ? true : false
  end

end