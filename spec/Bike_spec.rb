require "Bike.rb"

describe Bike do

  subject(:bike) {described_class.new}

  it "returns working == true if bike is working" do
    expect(bike.working?).to eq true
  end

  it "returns false if bike is report_broken" do
    bike.report_broken
    expect(bike).not_to be_working
  end

end
