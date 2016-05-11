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
      it "returns 0 for NORTH" do
        expect(described_class.value_for("NORTH")).to eq 0
      end

      it "returns 1 for EAST" do
        expect(described_class.value_for("EAST")).to eq 1
      end

      it "returns 2 for SOUTH" do
        expect(described_class.value_for("SOUTH")).to eq 2
      end

      it "returns 3 for WEST" do
        expect(described_class.value_for("WEST")).to eq 3
      end
    end
  end
end
