require "spec_helper"

RSpec.describe RobotApplication::Command::Move::South do
  let(:move) { described_class.new(robot: robot, table: table) }
  let(:robot) do
    RobotApplication::Robot.new.tap do |robot|
      robot.update_position(
        x: x,
        y: y,
        direction: direction,
      )
    end
  end
  let(:x) { 1 }
  let(:y) { 2 }
  let(:direction) { RobotApplication::FacingDirection[:south] }
  let(:table) { RobotApplication::Table.new(width: width, height: height) }
  let(:width) { 5 }
  let(:height) { 6 }

  describe "#execute" do
    context "when the robot is NOT already at the south edge" do
      let(:y) { 1 }

      it "decrements the robot's y coordinate" do
        move.execute
        expect(robot.y).to eq (y - 1)
      end
    end

    context "when the robot is already at the south edge" do
      let(:y) { 0 }

      it "does not decrement the robot's y coordinate" do
        move.execute
        expect(robot.y).to eq (y)
      end
    end
  end
end
