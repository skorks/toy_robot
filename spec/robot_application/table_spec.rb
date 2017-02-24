require "spec_helper"

RSpec.describe RobotApplication::Table do
  let(:table) { described_class.new(width: width, height: height) }
  let(:width) { 12 }
  let(:height) { 3 }

  describe "#contains_coordinates?" do
    it "is true when x is 0 and y is 0" do
      expect(table.contains_coordinates?(x: 0, y: 0)).to be_truthy
    end

    it "is false when x is less than 0" do
      expect(table.contains_coordinates?(x: -1, y: 0)).to be_falsy
    end

    it "is false when y is less than 0" do
      expect(table.contains_coordinates?(x: 0, y: -1)).to be_falsy
    end

    it "is true when x is greater than 0 but less than the width" do
      expect(table.contains_coordinates?(x: width - 1, y: 0)).to be_truthy
    end

    it "is true when y is greater than 0 but less than the height" do
      expect(table.contains_coordinates?(x: 0, y: height - 1)).to be_truthy
    end

    it "is false when x is equal to the width" do
      expect(table.contains_coordinates?(x: width, y: 0)).to be_falsy
    end

    it "is false when y is equal to the height" do
      expect(table.contains_coordinates?(x: 0, y: height)).to be_falsy
    end

    it "is false when x is greater than the width" do
      expect(table.contains_coordinates?(x: width + 1, y: 0)).to be_falsy
    end

    it "is false when y is greater than the height" do
      expect(table.contains_coordinates?(x: 0, y: height + 1)).to be_falsy
    end
  end
end
