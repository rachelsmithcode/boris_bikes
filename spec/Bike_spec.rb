require "bike"

describe Bike do

  subject(:bike) {described_class.new}

  it "returns working as true when initialize" do
    expect(bike).to be_working
  end

  it "returns working as false if bike is reported broken" do
    bike.report_broken
    expect(bike).not_to be_working
  end

  it "returns working as true if bike is fixed" do
    bike.report_broken
    bike.be_fixed
    expect(bike).to be_working
  end

end
