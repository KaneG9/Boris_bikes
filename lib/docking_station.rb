require_relative 'bike'
class DockingStation
  attr_reader :bike
  
  def initialize
    @bike = []
  end

  def release_bike
    raise RuntimeError, "No Bikes Availiable" if @bike.empty? 
    new_bike = Bike.new
  end

  def dock(bike)
    @bike << bike
  end
end