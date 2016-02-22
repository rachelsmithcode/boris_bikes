require "docking_station"
require "bike_container"

describe DockingStation do

  subject(:dockingstation) {described_class.new}
  let(:bike) {double :bike}
  let(:van) {double :van}


  describe "docking bikes" do

    it "allows a working bike to be docked" do
      dockingstation.dock(bike)
      expect(dockingstation.bikecontainer).to eq [bike]
    end

    it "allows a broken bike to be docked" do
      allow(bike).to receive(:working?).and_return(false)
      expect{dockingstation.dock(bike)}.not_to raise_error
    end

    it "raises an error if there is no room for extra bikes, (default max of 20 bikes)" do
      expect{21.times{dockingstation.dock(bike)}}.to raise_error("Bike dock full")
    end

    it "allows the maximum capacity to be changed from the default of 20 when initialized" do
      expect(DockingStation.new(40).capacity).to eq 40
    end

  end

  describe "releasing bikes from dock" do

    it "release a working bike from a dockingstaion if there is one docked" do
      allow(bike).to receive(:working?).and_return(true)
      dockingstation.dock(bike)
      expect(dockingstation.release_bike(bike)).to eq(bike)
    end

    it "returns the same instance of bike that docked when released" do
      allow(bike).to receive(:working?).and_return(true)
      dockingstation.dock(bike)
      expect(dockingstation.release_bike(bike).object_id).to eq bike.object_id
    end

    it "returns an error on release if the docking station does not have a bike to release" do
      expect {dockingstation.release_bike("bike")}.to raise_error("No bike to release, use you eyes!")
    end

    it "returns an error if the bike being released is broken" do
      allow(bike).to receive(:working?).and_return(false)
      dockingstation.dock(bike)
      expect{dockingstation.release_bike(bike)}.to raise_error("This bike is broken, please select a different bike")
      expect(dockingstation.bikecontainer).to eq([bike])
    end

  end

  describe "taking repaired bikes from the van" do

    it "takes working bikes from van" do
      allow(van).to receive(:bikecontainer).and_return([bike, bike, bike])
      dockingstation.take_bikes_from_van(van)
      expect(dockingstation.bikecontainer).to eq [bike, bike, bike]
    end

  end

end
