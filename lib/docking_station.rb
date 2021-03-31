require_relative 'bike'
class DockingStation
  attr_reader :bikes
  
  def initialize(capacity = 20)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise RuntimeError, "No Bikes Availiable" if @bikes.empty? 
    new_bike = Bike.new
  end

  def dock(bike)
    raise RuntimeError, "Docking station is full" if @bikes.size >= @capacity
    @bikes << bike
  end
end