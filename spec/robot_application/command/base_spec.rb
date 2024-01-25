require "spec_helper"

RSpec.describe RobotApplication::Command::Base do
  let(:command) { described_class.new(type: "", arguments: []) }

  describe "#execute" do
    it "raises an error trying to execute the command" do
      expect{ command.execute(robot: "", table: "") }.to raise_error(RobotApplication::Error)
    end
  end
end
