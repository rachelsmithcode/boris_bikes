require "Van.rb"
require "./lib/BikeContainer.rb"

describe Van do

  subject(:van) {described_class.new}
  let(:dockingstation) {double :dockingstation}
  let(:garage) {double :garage}
  let(:bike) {double :bike}

  it "takes broken bikes from docking station" do
    allow(dockingstation).to receive(:bikecontainer).and_return([bike, bike, bike])
    subject.take_broken_bikes(dockingstation)
    expect(subject.bikecontainer).to eq [bike, bike, bike]
  end

  it "takes working bikes from garage" do
    allow(garage).to receive(:bikecontainer).and_return([bike, bike, bike])
    subject.take_working_bikes(garage)
    expect(subject.bikecontainer).to eq [bike, bike, bike]
  end


end
