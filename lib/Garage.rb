class Garage
  include BikeContainer
  attr_reader :bikecontainer

  def initialize
    set_up_container
  end

  def take_broken_bikes van
    van.bikecontainer.each do |bike|
      @bikecontainer << bike # if bike.working?
    end
  end
end
