require "spec_helper"

RSpec.describe RobotApplication::Table do
  let(:table) { described_class.new(width: width, height: height) }
  let(:width) { 12 }
  let(:height) { 3 }
  let(:robot) { double "robot" }

  describe "#containsRobot?" do
    context "when table contains robot" do
      before do
        table.robot = robot
      end

      it "returns truthy" do
        expect(table.containsRobot?).to be_truthy
      end
    end

    context "when table doesn't contain robot" do
      it "returns falsy" do
        expect(table.containsRobot?).to be_falsy
      end
    end
  end
end
