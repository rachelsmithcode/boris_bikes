require "./lib/Bike.rb"
require "./lib/BikeContainer.rb"

class DockingStation
  include BikeContainer
  attr_reader :bikecontainer, :capacity


  def initialize(capacity = 20)
    set_up_container
    @capacity = capacity
  end

  def release_bike(bike)
    if empty?
      raise "No bike to release, use you eyes!"
    elsif bike.working? == false
      raise "This bike is broken, please select a different bike"
    else
      @bikecontainer.delete(bike)
      bike
    end
  end

  def dock(bike)
    if full?
      raise "Bike dock full"
    else
      @bikecontainer.push(bike)
    end
  end

  def take_bikes_from_van(van)
    van.bikecontainer.each do |bike|
      @bikecontainer << bike # if bike.working?
    end
  end

private

  def full?
    @bikecontainer.length >= @capacity ? true : false
  end

  def empty?
    @bikecontainer.empty?
  end

end
