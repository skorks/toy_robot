require "spec_helper"

RSpec.describe RobotApplication::CommandFactory::ReportRobotCommand do
  let(:command) { described_class.new(type: type, arguments: []) }
  let(:type) { "REPORT" }
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

    it "outputs the position of the robot" do
      expect($stdout).to receive(:puts).with("#{x},#{y},#{direction}")
      execute
    end

    context "when robot is not on the table" do
      let(:robot_idle) { true }

      it "doesn't output anything" do
        expect($stdout).to_not receive(:puts)
        execute
      end
    end
  end
end
