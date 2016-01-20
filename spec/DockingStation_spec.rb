require "DockingStation.rb"
require "./lib/BikeContainer.rb"

describe DockingStation do

  subject(:dockingstation) {described_class.new}
  let(:bike) {double :bike}
  let(:van) {double :van}

  it "returns release_bike == true when asked to release bike" do
     expect(dockingstation).to respond_to (:release_bike)
  end

  it "new bike.working? should return true" do
    allow(bike).to receive(:working?).and_return(true)
    expect(bike.working?).to be_truthy
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikecontainer) }

  it "docks bike" do
    subject.dock(bike)
    expect(subject.bikecontainer).to eq [bike]
  end

  it "returns the same bike as was docked once docked" do
    allow(bike).to receive(:working?).and_return(true)
    subject.dock(bike)
    expect(subject.release_bike(bike)).to eq bike
  end

  it "returns an error if the docking station does not have a bike docked" do
    expect {subject.release_bike("bike")}.to raise_error(RuntimeError)
  end

  # it "returns an error if the docking station already contains a bike" do
  #   bike = Bike.new
  #   bike2 = Bike.new
  #   expect {subject.dock(bike);(subject.dock(bike2))}.to raise_error(RuntimeError)
  # end

  it "returns no room for extra bikes when more than 20 bikes are docked" do
    expect{21.times{subject.dock(bike)}}.to raise_error(RuntimeError)
  end

  it "Allows a capacity to be set altering the number of bikes that can be docked" do
    expect(DockingStation.new.capacity).to eq 20
  end

  it "returns an error if the bike being released is broken and does not release" do
    allow(bike).to receive(:report_broken).and_return(false)
    expect{subject.release_bike(bike)}.to raise_error(RuntimeError)
  end

  it "Allows bikes to be docked if broken or working" do
    allow(bike).to receive(:report_broken).and_return(false)
    expect{subject.dock(bike)}.not_to raise_error
  end

  it "takes working bikes from van" do
    allow(van).to receive(:bikecontainer).and_return([bike, bike, bike])
    subject.take_bikes_from_van(van)
    expect(subject.bikecontainer).to eq [bike, bike, bike]
  end

end
