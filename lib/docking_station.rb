require_relative 'bike'
class DockingStation
  attr_reader :bike
  
  def initialize(capacity = 1)
    @bike = []
    @capacity = capacity
  end

  def release_bike
    raise RuntimeError, "No Bikes Availiable" if @bike.empty? 
    new_bike = Bike.new
  end

  def dock(bike)
    raise RuntimeError, "Docking station is full" if @bike.size >= @capacity
    @bike << bike
  end
end