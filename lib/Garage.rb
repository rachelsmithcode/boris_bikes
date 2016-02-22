class Garage
  include BikeContainer
  attr_reader :bikecontainer

  def initialize
    set_up_container
  end

  def fix_bikes
    @bikecontainer.each do |bike|
      bike.be_fixed
    end
  end

  def take_broken_bikes van
    van.bikecontainer.each do |bike|
      @bikecontainer << bike
    end
  end
end
