require "spec_helper"

RSpec.describe RobotApplication::CommandFactory::Moves::WestMove do
  let(:move) { described_class.new(robot: robot, table: table) }
  let(:robot) do
    RobotApplication::Robot.new.tap do |robot|
      robot.update_position(
        x: x,
        y: y,
        direction: direction,
        table: table,
      )
    end
  end
  let(:x) { 1 }
  let(:y) { 2 }
  let(:direction) { RobotApplication::FacingDirection[:west] }
  let(:table) { RobotApplication::Table.new(width: width, height: height) }
  let(:width) { 5 }
  let(:height) { 6 }

  describe "#execute" do
    context "when the robot is NOT already at the west edge" do
      let(:x) { 1 }

      it "decrements the robot's x coordinate" do
        move.execute
        expect(robot.x).to eq (x - 1)
      end
    end

    context "when the robot is already at the west edge" do
      let(:x) { 0 }

      it "does not decrement the robot's x coordinate" do
        move.execute
        expect(robot.x).to eq (x)
      end
    end
  end
end
