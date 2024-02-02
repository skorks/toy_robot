require "spec_helper"

RSpec.describe RobotApplication::Compass do
  let(:compass) { described_class.new }

  describe "#valid?" do
    context "when direction string is not valid" do
      it "return falsy" do
        expect(compass.valid?("hello")).to be_falsy
      end
    end

    context "when direction string is valid" do
      ["NORTH", "SOUTH", "EAST", "WEST"].each do |direction|
        it "return truthy for #{direction}" do
          expect(compass.valid?(direction)).to be_truthy
        end
      end
    end
  end

  describe "#value_for" do
    context "when direction string is not valid" do
      it "return nil" do
        expect(compass.value_for("hello")).to eq nil
      end
    end

    context "when direction string is valid" do
      it "returns 0 for NORTH" do
        expect(compass.value_for("NORTH")).to eq 0
      end

      it "returns 90 for EAST" do
        expect(compass.value_for("EAST")).to eq 90
      end

      it "returns 180 for SOUTH" do
        expect(compass.value_for("SOUTH")).to eq 180
      end

      it "returns 270 for WEST" do
        expect(compass.value_for("WEST")).to eq 270
      end
    end
  end

  describe "#name_for" do
    context "when direction integer is not valid" do
      it "return nil" do
        expect(compass.name_for(12)).to eq nil
      end
    end

    context "when direction integer is valid" do
      it "returns NORTH for 0" do
        expect(compass.name_for(0)).to eq "NORTH"
      end

      it "returns EAST for 90" do
        expect(compass.name_for(90)).to eq "EAST"
      end

      it "returns SOUTH for 180" do
        expect(compass.name_for(180)).to eq "SOUTH"
      end

      it "returns WEST for 270" do
        expect(compass.name_for(270)).to eq "WEST"
      end
    end
  end
end
