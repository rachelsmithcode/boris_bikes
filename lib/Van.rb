

class Van
include BikeContainer
  attr_reader :bikecontainer

  def initialize
    set_up_container
  end

  def take_broken_bikes(dockingstation)
    dockingstation.bikecontainer.each do
      |bike| @bikecontainer.push(bike)
    end
    #bikes_in_dock.select do
    #  |bike| @bikes_in_van.push(bike) if bike.working?
    #end
    @bikecontainer
  end

  def take_working_bikes(garage)
    garage.bikecontainer.each do
      |bike| @bikecontainer.push(bike)
    end
  end

end
