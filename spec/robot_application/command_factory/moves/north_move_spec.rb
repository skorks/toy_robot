require "spec_helper"

RSpec.describe RobotApplication::CommandFactory::Moves::NorthMove do
  let(:move) { described_class.new(robot: robot, table: table) }
  let(:robot) { double "robot", x: x, y: y, facing: facing }
  let(:x) { 1 }
  let(:y) { 2 }
  let(:facing) { RobotApplication::FacingDirection::NORTH }
  let(:table) { double "table", width: width, height: height }
  let(:width) { 5 }
  let(:height) { 6 }

  describe "#permitted?" do
    context "when robot is at the north edge" do
      let(:y) { height - 1 }

      it "return falsy" do
        expect(move.permitted?).to be_falsy
      end
    end

    context "when robot is NOT at the north edge" do
      let(:y) { height - 2 }

      it "return truthy" do
        expect(move.permitted?).to be_truthy
      end
    end
  end

  describe "#execute" do
    before do
      allow(robot).to receive(:set_position)
    end

    it "increments the robot's y coordinate" do
      expect(robot).to receive(:set_position).with(x: x, y: y + 1)
      move.execute
    end
  end
end
