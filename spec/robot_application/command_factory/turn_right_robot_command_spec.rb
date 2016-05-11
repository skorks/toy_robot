require "spec_helper"

RSpec.describe RobotApplication::CommandFactory::TurnRightRobotCommand do
  let(:command) { described_class.new(type: type, arguments: []) }
  let(:type) { "RIGHT" }
  let(:x) { "1" }
  let(:y) { "2" }
  let(:facing) { "SOUTH" }
  let(:robot) { double "robot", x: x, y: y, facing: RobotApplication::FacingDirection::value_for(facing) }
  let(:table) { double "table", width: width, height: height, containsRobot?: containsRobot }
  let(:containsRobot) { true }
  let(:width) { 5 }
  let(:height) { 6 }

  describe "#execute" do
    let(:execute) { command.execute(robot: robot, table: table) }

    before do
      allow(robot).to receive(:set_facing)
    end

    context "when facing NORTH" do
      let(:facing) { "NORTH" }

      it "turns the robot right correctly" do
        expect(robot).to receive(:set_facing).with(RobotApplication::FacingDirection::EAST)
        execute
      end
    end

    context "when facing EAST" do
      let(:facing) { "EAST" }

      it "turns the robot right correctly" do
        expect(robot).to receive(:set_facing).with(RobotApplication::FacingDirection::SOUTH)
        execute
      end
    end

    context "when facing SOUTH" do
      let(:facing) { "SOUTH" }

      it "turns the robot right correctly" do
        expect(robot).to receive(:set_facing).with(RobotApplication::FacingDirection::WEST)
        execute
      end
    end

    context "when facing WEST" do
      let(:facing) { "WEST" }

      it "turns the robot right correctly" do
        expect(robot).to receive(:set_facing).with(RobotApplication::FacingDirection::NORTH)
        execute
      end
    end

    context "when robot is not on the table" do
      let(:containsRobot) { false }

      it "doesn't try to set the facing direction" do
        expect(robot).to_not receive(:set_facing)
        execute
      end
    end
  end
end
