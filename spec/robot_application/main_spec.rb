# frozen_string_literal: true

require "spec_helper"

RSpec.describe RobotApplication::Main do
  let(:main) do
    described_class.new(dependency_container:)
  end
  let(:dependency_container) do
    RobotApplication::DependencyContainer.new({
      width: width,
      height: height,
      renderer: :null,
      table_renderer: table_renderer,
      input_reader: input_reader,
      input_parser: input_parser,
    })
  end
  let(:width) { 7 }
  let(:height) { 8 }
  let(:input_reader) { [input_string1, input_string2] }
  let(:input_string1) { "input_string1" }
  let(:input_string2) { "input_string2" }
  let(:input_parser) { double "input_parser", parse: [command] }
  let(:table_renderer) { double "table_renderer", render: nil }
  let(:command) { double "command", execute: nil }

  let(:robot) { double "robot" }
  let(:table) { double "table" }

  before do
    allow(RobotApplication::Robot).to receive(:new).and_return(robot)
    allow(RobotApplication::Table).to receive(:new).with(width: width, height: height).and_return(table)
  end

  describe "#execute" do
    it "parses all the input strings" do
      expect(input_parser).to receive(:parse).with(input_string: input_string1)
      expect(input_parser).to receive(:parse).with(input_string: input_string2)
      main.execute
    end

    it "executes a command with robot and table for every input" do
      expect(command).to receive(:execute).with(dependency_container:).twice
      main.execute
    end

    it "renders the table for every input" do
      expect(table_renderer).to receive(:render).with(dependency_container:).twice
      main.execute
    end
  end
end
