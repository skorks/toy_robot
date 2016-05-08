require "spec_helper"

RSpec.describe RobotApplication::InputParser do
  let(:input_parser) { described_class.new(command_factory: command_factory) }
  let(:command_factory) { double "command_factory", build: nil }

  describe "#parse" do
    let(:parse) { input_parser.parse(input_string: input_string) }

    context "when input is a command type with no arguments" do
      let(:input_string) { "MOVE" }

      it "it parses the command type correctly" do
        expect(command_factory).to receive(:build).with(type: "MOVE", arguments: [])
        parse
      end

      context "and the input is not upper case" do
        let(:input_string) { "move" }

        it "it parses the command type correctly" do
          expect(command_factory).to receive(:build).with(type: "MOVE", arguments: [])
          parse
        end
      end
    end

    context "when input is a command type with arguments" do
      let(:input_string) { "PLACE 1,2,NORTH" }

      it "it parses the command type correctly" do
        expect(command_factory).to receive(:build).with(type: "PLACE", arguments: ["1", "2", "NORTH"])
        parse
      end

      context "and the input is not upper case" do
        let(:input_string) { "place 1,2,north" }

        it "it parses the command type correctly" do
          expect(command_factory).to receive(:build).with(type: "PLACE", arguments: ["1", "2", "NORTH"])
          parse
        end
      end
    end
  end
end
