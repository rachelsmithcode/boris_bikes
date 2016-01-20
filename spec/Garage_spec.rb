require "Garage.rb"
require "./lib/BikeContainer.rb"

describe Garage do

  subject(:garage) {described_class.new}
  let(:van) {double :van}
  let(:bike) {double :bike}

  it "takes broken bikes from docking station" do
    allow(van).to receive(:bikecontainer).and_return([bike, bike, bike])
    subject.take_broken_bikes(van)
    expect(subject.bikecontainer).to eq [bike, bike, bike]
  end

end
