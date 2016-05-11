require "spec_helper"

RSpec.describe RobotApplication::FacingDirection do
  describe "#valid?" do
    context "when direction string is not valid" do
      it "return falsy" do
        expect(described_class.valid?("hello")).to be_falsy
      end
    end

    context "when direction string is valid" do
      ["NORTH", "SOUTH", "EAST", "WEST"].each do |direction|
        it "return truthy for #{direction}" do
          expect(described_class.valid?(direction)).to be_truthy
        end
      end
    end
  end

  describe "#value_for" do
    context "when direction string is not valid" do
      it "return nil" do
        expect(described_class.value_for("hello")).to eq nil
      end
    end

    context "when direction string is valid" do
      it "returns #{RobotApplication::FacingDirection::NORTH} for NORTH" do
        expect(described_class.value_for("NORTH")).to eq RobotApplication::FacingDirection::NORTH
      end

      it "returns #{RobotApplication::FacingDirection::EAST} for EAST" do
        expect(described_class.value_for("EAST")).to eq RobotApplication::FacingDirection::EAST
      end

      it "returns #{RobotApplication::FacingDirection::SOUTH} for SOUTH" do
        expect(described_class.value_for("SOUTH")).to eq RobotApplication::FacingDirection::SOUTH
      end

      it "returns #{RobotApplication::FacingDirection::WEST} for WEST" do
        expect(described_class.value_for("WEST")).to eq RobotApplication::FacingDirection::WEST
      end
    end
  end

  describe "#name_for" do
    context "when direction integer is not valid" do
      it "return nil" do
        expect(described_class.name_for(12)).to eq nil
      end
    end

    context "when direction integer is valid" do
      it "returns NORTH for #{RobotApplication::FacingDirection::NORTH}" do
        expect(described_class.name_for(RobotApplication::FacingDirection::NORTH)).to eq "NORTH"
      end

      it "returns EAST for #{RobotApplication::FacingDirection::EAST}" do
        expect(described_class.name_for(RobotApplication::FacingDirection::EAST)).to eq "EAST"
      end

      it "returns SOUTH for #{RobotApplication::FacingDirection::SOUTH}" do
        expect(described_class.name_for(RobotApplication::FacingDirection::SOUTH)).to eq "SOUTH"
      end

      it "returns WEST for #{RobotApplication::FacingDirection::WEST}" do
        expect(described_class.name_for(RobotApplication::FacingDirection::WEST)).to eq "WEST"
      end
    end
  end
end
