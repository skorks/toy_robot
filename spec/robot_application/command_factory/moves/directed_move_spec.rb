require "spec_helper"

RSpec.describe RobotApplication::CommandFactory::Moves::DirectedMove do
  let(:move) { described_class.new(robot: robot, table: table) }
  let(:robot) { double "robot" }
  let(:table) { double "table" }

  describe "#permitted?" do
    it "raises an error trying to find out if move is permitted" do
      expect{ move.permitted? }.to raise_error(RobotApplication::Error)
    end
  end

  describe "#execute" do
    it "raises an error trying to execute the move" do
      expect{ move.execute }.to raise_error(RobotApplication::Error)
    end
  end
end
