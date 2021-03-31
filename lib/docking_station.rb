require_relative 'bike'
class DockingStation
  attr_reader :bikes, :DEFAULT_CAPACITY
  DEFAULT_CAPACITY = 20

  def initialize()
    @bikes = []
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
    @bikes.size >= DEFAULT_CAPACITY ? true : false
  end 

  def empty?
    @bikes.empty? ? true : false
  end

end