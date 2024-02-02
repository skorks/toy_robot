require "spec_helper"

RSpec.describe RobotApplication::Command::TurnLeft do
  let(:command) { described_class.new(type: type, arguments: []) }
  let(:dependency_container) { double("dependency_container", robot: robot, table: table, compass: compass) }
  let(:compass) { RobotApplication::Compass.new }
  let(:type) { "LEFT" }
  let(:x) { "1" }
  let(:y) { "2" }
  let(:direction) { "SOUTH" }
  let(:robot) do
    double "robot", {
      x: x,
      y: y,
      direction: compass.value_for(direction),
      idle?: robot_idle,
    }
  end
  let(:table) { double "table", width: width, height: height }
  let(:width) { 5 }
  let(:height) { 6 }
  let(:robot_idle) { false }

  describe "#execute" do
    let(:execute) { command.execute(dependency_container:) }

    before do
      allow(robot).to receive(:update_direction)
    end

    context "when facing NORTH" do
      let(:direction) { "NORTH" }

      it "turns the robot left correctly" do
        expect(robot).to receive(:update_direction).with(direction: compass[:west])
        execute
      end
    end

    context "when facing WEST" do
      let(:direction) { "WEST" }

      it "turns the robot left correctly" do
        expect(robot).to receive(:update_direction).with(direction: compass[:south])
        execute
      end
    end

    context "when facing SOUTH" do
      let(:direction) { "SOUTH" }

      it "turns the robot left correctly" do
        expect(robot).to receive(:update_direction).with(direction: compass[:east])
        execute
      end
    end

    context "when facing EAST" do
      let(:direction) { "EAST" }

      it "turns the robot left correctly" do
        expect(robot).to receive(:update_direction).with(direction: compass[:north])
        execute
      end
    end

    context "when robot is not on the table" do
      let(:robot_idle) { true }

      it "doesn't try to set the facing direction" do
        expect(robot).to_not receive(:update_direction)
        execute
      end
    end
  end
end
