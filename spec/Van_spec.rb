require "van"
require "bike_container"

describe Van do

  subject(:van) {described_class.new}
  let(:dockingstation) {double :dockingstation}
  let(:garage) {double :garage}
  let(:bike) {double :bike}

  it "takes broken bikes from a docking station" do
    allow(dockingstation).to receive(:bikecontainer).and_return([bike, bike, bike])
    van.take_broken_bikes(dockingstation)
    expect(van.bikecontainer).to eq [bike, bike, bike]
  end

  it "takes working bikes from a garage" do
    allow(garage).to receive(:bikecontainer).and_return([bike, bike, bike])
    van.take_working_bikes(garage)
    expect(van.bikecontainer).to eq [bike, bike, bike]
  end


end
