require_relative "bike"
require_relative "bike_container"

class DockingStation
  include BikeContainer
  attr_reader :bikecontainer, :capacity


  def initialize(capacity = 20)
    set_up_container
    @capacity = capacity
  end

  def release_bike(bike)
      raise "No bike to release, use you eyes!" if empty?
      raise "This bike is broken, please select a different bike" if !bike.working?
      @bikecontainer.delete(bike)
      bike
  end

  def dock(bike)
    full? ? raise("Bike dock full") : @bikecontainer.push(bike)
  end

  def take_bikes_from_van(van)
    van.bikecontainer.each do |bike|
      @bikecontainer << bike
    end
  end

private

  def full?
    @bikecontainer.length >= @capacity
  end

  def empty?
    @bikecontainer.empty?
  end

end
