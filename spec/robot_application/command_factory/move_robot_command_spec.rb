require "spec_helper"

RSpec.describe RobotApplication::CommandFactory::MoveRobotCommand do
  let(:command) { described_class.new(type: type, arguments: []) }
  let(:type) { "LEFT" }
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

    let(:north_move) { double "north_move", permitted?: true, execute: nil }
    let(:east_move) { double "east_move", permitted?: true, execute: nil }
    let(:south_move) { double "south_move", permitted?: true, execute: nil }
    let(:west_move) { double "west_move", permitted?: true, execute: nil }

    before do
      allow(RobotApplication::CommandFactory::Moves::NorthMove).to receive(:new).and_return(north_move)
      allow(RobotApplication::CommandFactory::Moves::EastMove).to receive(:new).and_return(east_move)
      allow(RobotApplication::CommandFactory::Moves::SouthMove).to receive(:new).and_return(south_move)
      allow(RobotApplication::CommandFactory::Moves::WestMove).to receive(:new).and_return(west_move)
    end

    context "when facing NORTH" do
      let(:facing) { "NORTH" }

      it "performs a north move" do
        expect(north_move).to receive(:execute)
        execute
      end
    end

    context "when facing WEST" do
      let(:facing) { "WEST" }

      it "performs a west move" do
        expect(west_move).to receive(:execute)
        execute
      end
    end

    context "when facing SOUTH" do
      let(:facing) { "SOUTH" }

      it "performs a south move" do
        expect(south_move).to receive(:execute)
        execute
      end
    end

    context "when facing EAST" do
      let(:facing) { "EAST" }

      it "performs a east move" do
        expect(east_move).to receive(:execute)
        execute
      end
    end

    context "when robot is not on the table" do
      let(:containsRobot) { false }

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
