require "spec_helper"

RSpec.describe RobotApplication::CommandFactory::TurnRightRobotCommand do
  let(:command) { described_class.new(type: type, arguments: []) }
  let(:type) { "RIGHT" }
  let(:x) { "1" }
  let(:y) { "2" }
  let(:direction) { "SOUTH" }
  let(:robot) do
    double "robot", {
      x: x,
      y: y,
      direction: RobotApplication::FacingDirection.value_for(direction),
      idle?: robot_idle,
    }
  end
  let(:table) { double "table", width: width, height: height }
  let(:width) { 5 }
  let(:height) { 6 }
  let(:robot_idle) { false }

  describe "#execute" do
    let(:execute) { command.execute(robot: robot, table: table) }

    before do
      allow(robot).to receive(:update_position)
    end

    context "when facing NORTH" do
      let(:direction) { "NORTH" }

      it "turns the robot right correctly" do
        expect(robot).to receive(:update_position).with(direction: RobotApplication::FacingDirection[:east])
        execute
      end
    end

    context "when facing EAST" do
      let(:direction) { "EAST" }

      it "turns the robot right correctly" do
        expect(robot).to receive(:update_position).with(direction: RobotApplication::FacingDirection[:south])
        execute
      end
    end

    context "when facing SOUTH" do
      let(:direction) { "SOUTH" }

      it "turns the robot right correctly" do
        expect(robot).to receive(:update_position).with(direction: RobotApplication::FacingDirection[:west])
        execute
      end
    end

    context "when facing WEST" do
      let(:direction) { "WEST" }

      it "turns the robot right correctly" do
        expect(robot).to receive(:update_position).with(direction: RobotApplication::FacingDirection[:north])
        execute
      end
    end

    context "when robot is not on the table" do
      let(:robot_idle) { true }

      it "doesn't try to set the facing direction" do
        expect(robot).to_not receive(:update_position)
        execute
      end
    end
  end
end
