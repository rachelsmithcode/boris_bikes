class Bike

  def initialize
    @working = true
  end

  def working?
   @working
  end

  def report_broken
    @working = false
  end

  def be_fixed
    @working = true
  end

  def docked?
    false
  end

end
