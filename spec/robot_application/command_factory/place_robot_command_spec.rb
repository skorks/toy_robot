require "spec_helper"

RSpec.describe RobotApplication::CommandFactory::PlaceRobotCommand do
  let(:command) { described_class.new(type: type, arguments: [x,y,facing]) }
  let(:type) { "PLACE" }
  let(:x) { "1" }
  let(:y) { "2" }
  let(:facing) { "SOUTH" }
  let(:robot) { double "robot" }
  let(:table) { double "table", width: width, height: height }
  let(:width) { 5 }
  let(:height) { 6 }

  describe "#execute" do
    let(:execute) { command.execute(robot: robot, table: table) }

    before do
      allow(table).to receive(:robot=).with(robot)
      allow(robot).to receive(:set_position)
    end

    it "set the robot on the table" do
      expect(table).to receive(:robot=).with(robot)
      execute
    end

    it "sets the position on the robot" do
      expect(robot).to receive(:set_position).with(x: x.to_i, y: y.to_i, facing: RobotApplication::FacingDirection::SOUTH)
      execute
    end

    context "when x is not an integer" do
      let(:x) { "abc" }

      it "outputs error to stderr" do
        expect($stderr).to receive(:puts)
        execute
      end
    end

    context "when y is not an integer" do
      let(:y) { "abc" }

      it "outputs error to stderr" do
        expect($stderr).to receive(:puts)
        execute
      end
    end

    context "when facing direction is invalid" do
      let(:facing) { "abc" }

      it "outputs error to stderr" do
        expect($stderr).to receive(:puts)
        execute
      end
    end

    context "when x is out of bounds for the table" do
      let(:x) { width }

      it "outputs error to stderr" do
        expect($stderr).to receive(:puts)
        execute
      end
    end

    context "when y is out of bounds for the table" do
      let(:y) { height }

      it "outputs error to stderr" do
        expect($stderr).to receive(:puts)
        execute
      end
    end
  end
end