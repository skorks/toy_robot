require "spec_helper"

RSpec.describe RobotApplication::Command::Move::Base do
  let(:move) { described_class.new(robot: robot, table: table) }

  let(:robot) { double("robot", x: x, y: y, update_position: nil) }
  let(:table) { double("table", valid_position?: true) }
  let(:x) { 1 }
  let(:y) { 2 }

  describe "#next_position" do
    it "returns the current position of the robot" do
      expect(move.next_position).to eq({ x: x, y: y })
    end
  end

  describe "#execute" do
    it "updates the robot's position if the table contains the next position" do
      expect(table).to receive(:valid_position?).with(x: x, y: y).and_return(true)
      expect(robot).to receive(:update_position).with(x: x, y: y)
      move.execute
    end

    it "does not update the robot's position if the table does not contain the next position" do
      expect(table).to receive(:valid_position?).with(x: x, y: y).and_return(false)
      expect(robot).not_to receive(:update_position)
      move.execute
    end
  end
end
