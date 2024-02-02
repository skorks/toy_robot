require "spec_helper"

RSpec.describe RobotApplication::Command::Move do
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

    let(:north_move) { double "north_move", execute: nil }
    let(:east_move) { double "east_move", execute: nil }
    let(:south_move) { double "south_move", execute: nil }
    let(:west_move) { double "west_move", execute: nil }

    before do
      allow(RobotApplication::Command::Move::North).to receive(:new).and_return(north_move)
      allow(RobotApplication::Command::Move::East).to receive(:new).and_return(east_move)
      allow(RobotApplication::Command::Move::South).to receive(:new).and_return(south_move)
      allow(RobotApplication::Command::Move::West).to receive(:new).and_return(west_move)
    end

    context "when facing NORTH" do
      let(:direction) { "NORTH" }

      it "performs a north move" do
        expect(north_move).to receive(:execute)
        execute
      end
    end

    context "when facing WEST" do
      let(:direction) { "WEST" }

      it "performs a west move" do
        expect(west_move).to receive(:execute)
        execute
      end
    end

    context "when facing SOUTH" do
      let(:direction) { "SOUTH" }

      it "performs a south move" do
        expect(south_move).to receive(:execute)
        execute
      end
    end

    context "when facing EAST" do
      let(:direction) { "EAST" }

      it "performs a east move" do
        expect(east_move).to receive(:execute)
        execute
      end
    end

    context "when robot is not on the table" do
      let(:robot_idle) { true }

      it "doesn't try to move the robot" do
        expect(north_move).to_not receive(:execute)
        expect(south_move).to_not receive(:execute)
        expect(east_move).to_not receive(:execute)
        expect(west_move).to_not receive(:execute)
        execute
      end
    end
  end
end
