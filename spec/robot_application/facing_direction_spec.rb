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
      it "returns #{RobotApplication::FacingDirection[:north]} for NORTH" do
        expect(described_class.value_for("NORTH")).to eq RobotApplication::FacingDirection[:north]
      end

      it "returns #{RobotApplication::FacingDirection[:east]} for EAST" do
        expect(described_class.value_for("EAST")).to eq RobotApplication::FacingDirection[:east]
      end

      it "returns #{RobotApplication::FacingDirection[:south]} for SOUTH" do
        expect(described_class.value_for("SOUTH")).to eq RobotApplication::FacingDirection[:south]
      end

      it "returns #{RobotApplication::FacingDirection[:west]} for WEST" do
        expect(described_class.value_for("WEST")).to eq RobotApplication::FacingDirection[:west]
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
      it "returns NORTH for #{RobotApplication::FacingDirection[:north]}" do
        expect(described_class.name_for(RobotApplication::FacingDirection[:north])).to eq "NORTH"
      end

      it "returns EAST for #{RobotApplication::FacingDirection[:east]}" do
        expect(described_class.name_for(RobotApplication::FacingDirection[:east])).to eq "EAST"
      end

      it "returns SOUTH for #{RobotApplication::FacingDirection[:south]}" do
        expect(described_class.name_for(RobotApplication::FacingDirection[:south])).to eq "SOUTH"
      end

      it "returns WEST for #{RobotApplication::FacingDirection[:west]}" do
        expect(described_class.name_for(RobotApplication::FacingDirection[:west])).to eq "WEST"
      end
    end
  end
end
