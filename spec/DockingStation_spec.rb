require "DockingStation.rb"

describe DockingStation do

  subject(:dockingstation) {described_class.new}

  it "returns release_bike == true when asked to release bike" do
     expect(dockingstation).to respond_to (:release_bike)
  end

  it "new bike.working? should return true" do
    bike = subject.release_bike
    expect(bike.working?).to be_truthy
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it "docks bike" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it "returns the same bike as was docked once docked" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  it "returns an error if the docking station does not have a bike docked" do
    bike = subject.release_bike
    expect {subject.release_bike}.to raise_error(RuntimeError)
  end

  it "returns an error if the docking station already contains a bike" do
    bike = Bike.new
    bike2 = Bike.new
    expect {subject.dock(bike);(subject.dock(bike2))}.to raise_error(RuntimeError)
  end


end
