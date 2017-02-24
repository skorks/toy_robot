require "spec_helper"

RSpec.describe RobotApplication::CommandFactory do
  let(:command_factory) { described_class.new }

  describe "#build" do
    let(:build) { command_factory.build(type: type, arguments: arguments) }
    let(:arguments) { [] }

    context "when type is a PLACE command" do
      let(:type) { :place }
      let(:arguments) { "arguments" }

      it "returns the correct command type" do
        expect(build.class).to eq RobotApplication::CommandFactory::PlaceRobotCommand
      end

      it "return a command with the right arguments" do
        expect(build.arguments).to eq arguments
      end
    end

    context "when type is a MOVE command" do
      let(:type) { :move }

      it "returns the correct command type" do
        expect(build.class).to eq RobotApplication::CommandFactory::MoveRobotCommand
      end
    end

    context "when type is a LEFT command" do
      let(:type) { "LEFT" }

      it "returns the correct command type" do
        expect(build.class).to eq RobotApplication::CommandFactory::TurnLeftRobotCommand
      end
    end

    context "when type is a RIGHT command" do
      let(:type) { "RIGHT" }

      it "returns the correct command type" do
        expect(build.class).to eq RobotApplication::CommandFactory::TurnRightRobotCommand
      end
    end

    context "when type is a REPORT command" do
      let(:type) { "REPORT" }

      it "returns the correct command type" do
        expect(build.class).to eq RobotApplication::CommandFactory::ReportRobotCommand
      end
    end

    context "when type is an invalid command" do
      let(:type) { "foobar" }

      it "returns a null command" do
        expect(build.class).to eq RobotApplication::CommandFactory::NullRobotCommand
      end
    end
  end
end
