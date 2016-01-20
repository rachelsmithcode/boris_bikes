require "./lib/Bike.rb"

class DockingStation

  attr_reader :bikes_in_dock, :capacity


  def initialize(capacity = 20)
    @bikes_in_dock = []
    @capacity = capacity
  end

  def release_bike(bike)
    if empty?
      raise "No bike to release, use you eyes!"
    elsif bike.working? == false
      raise "This bike is broken, please select a different bike"
    else
      @bikes_in_dock.delete(bike)
      bike
    end
  end

  def dock(bike)
    if full?
      raise "Bike dock full"
    else
      @bikes_in_dock.push(bike)
    end
  end

private

  def full?
    @bikes_in_dock.length >= @capacity ? true : false
  end

  def empty?
    @bikes_in_dock.empty?
  end

end
