require "garage"
require "bike_container"

describe Garage do

  subject(:garage) {described_class.new}
  let(:van) {double :van}
  let(:bike) {double :bike}
  let(:bike1) {double :bike1}

  it "takes broken bikes from van" do
    allow(van).to receive(:bikecontainer).and_return([bike, bike, bike])
    garage.take_broken_bikes(van)
    expect(garage.bikecontainer).to eq [bike, bike, bike]
  end

  it "fixes broken bikes" do
    allow(van).to receive(:bikecontainer).and_return([bike1])
    garage.take_broken_bikes(van)
    expect(bike1).to receive(:be_fixed)
    garage.fix_bikes
  end

end
