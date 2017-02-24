require "spec_helper"

RSpec.describe RobotApplication::CommandFactory::PlaceRobotCommand do
  let(:command) { described_class.new(type: type, arguments: [x,y,direction]) }
  let(:type) { "PLACE" }
  let(:x) { "1" }
  let(:y) { "2" }
  let(:direction) { "SOUTH" }
  let(:robot) { double "robot" }
  let(:table) { RobotApplication::Table.new(width: width, height: height) }
  let(:width) { 5 }
  let(:height) { 6 }

  describe "#execute" do
    let(:execute) { command.execute(robot: robot, table: table) }

    before do
      allow(robot).to receive(:update_position)
    end

    it "sets the position on the robot" do
      expect(robot).to receive(:update_position).with(
        x: x.to_i,
        y: y.to_i,
        direction: RobotApplication::FacingDirection[:south],
        table: table,
      )
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
      let(:direction) { "abc" }

      it "outputs error to stderr" do
        expect($stderr).to receive(:puts)
        execute
      end
    end

    context "when facing direction contains extraneous whitespace" do
      let(:direction) { "SOUTH     " }

      it "sets the position on the robot" do
        expect(robot).to receive(:update_position).with(
          x: x.to_i,
          y: y.to_i,
          direction: RobotApplication::FacingDirection[:south],
          table: table,
        )
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
