require "spec_helper"

RSpec.describe RobotApplication::CommandFactory::ReportRobotCommand do
  let(:command) { described_class.new(type: type, arguments: []) }
  let(:type) { "REPORT" }
  let(:x) { "1" }
  let(:y) { "2" }
  let(:facing) { "SOUTH" }
  let(:robot) { double "robot", x: x, y: y, facing: RobotApplication::FacingDirection::SOUTH }
  let(:table) { double "table", width: width, height: height, containsRobot?: containsRobot }
  let(:containsRobot) { true }
  let(:width) { 5 }
  let(:height) { 6 }

  describe "#execute" do
    let(:execute) { command.execute(robot: robot, table: table) }

    it "outputs the position of the robot" do
      expect($stdout).to receive(:puts).with("#{x},#{y},#{facing}")
      execute
    end

    context "when robot is not on the table" do
      let(:containsRobot) { false }

      it "doesn't output anything" do
        expect($stdout).to_not receive(:puts)
        execute
      end
    end
  end
end
